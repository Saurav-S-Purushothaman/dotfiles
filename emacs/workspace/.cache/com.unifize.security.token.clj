(ns com.unifize.security.token
  "A namespace containing a protocol to generate and fetch access
  tokens.

  The `TokenManager` protocol exposes methods to generate, fetch, and
  get or generate tokens. A default implementation is provided in the
  form of `AtomTokenManager` that uses an atom as the storage for
  tokens. A custom implementation could use any storage backend.

  `AtomTokenManager`'s atom has an internal map structure as such:
  ```clojure
  {{:org-id 1} {:access-token \"eyJhbGciOiJSUz...\"
                :expires-at \"2023-03-21T08:43:23Z\"}
   {:org-id 1 :uid \"n6JS8min1Qf...\"} {:access-token \"eyJhbGciOiJSUz...\"
                                      :expires-at \"2023-03-21T08:43:23Z\"}}
  ```
  Where keys containing only the org-id represent bot tokens and keys
  containing a uid represent user (impersonation) tokens.

  ```clojure
  (get-or-generate!
   (->AtomTokenManager (atom {} :meta {:type :token-store})
                       {:app-id app-id
                        :private-key (buddy.core.keys/private-key private-key-path)
                        :api-host api-host})
   100)
  ```"
  (:require [buddy.core.keys :as keys]
            [buddy.sign.jwt :as jwt]
            [clj-http.client :as http]
            [java-time.api :as t]
            [clojure.spec.alpha :as s]
            [clojure.spec.test.alpha :as st]
            [com.unifize.utils :refer [json-str->edn]])
  (:gen-class))


(defn token-request
  "Returns a signed JWT that represents a request to generate an access
  token."
  [{:keys [app-id private-key]}]
  (let [current-time-in-seconds (quot (System/currentTimeMillis) 1000)]
    (jwt/sign {:iss app-id
               :iat current-time-in-seconds
               :exp (+ current-time-in-seconds 600)}
              private-key
              {:alg :rs256})))


(defn token-request-headers
  "Given a JWT token and an optional UID for impersonation, this
  function constructs a map of HTTP headers. If a UID is provided, it
  adds an `X-Unifize-User` header with the UID as its value.

  *Arguments*:
  * \"<jwt-token>\"
  *  \"<user-id>\"

  *Returns*:
  ```clojure
  {\"Authorization\" \"Bearer <jwt-token>\",
   \"X-Unifize-User\" \"<user-id>\"}
  ``` "
  [jwt & [uid]]
  (let [headers {"Authorization" (str "Bearer " jwt)}]
    (if uid
      (assoc headers "X-Unifize-User" uid)
      headers)))


(defn generate-token!
  "Generates an access token for the specified org.

  This function sends a request to the API to obtain an access token
  using a JWT token and an optional UID for user impersonation. Returns
  a map of the access token and expiry timestamp as strings.

  *Arguments*:
  * config map
  * `1`
  * \"<user-id>\"

  *Returns*:
  ```clojure
  {:access-token \"eyJhbGciOiJ...\",
   :expires-at \"2023-04-25T12:40:23.176Z\"}
  ```"
  [{api-host :api-host :as config} org-id & [uid]]
  (let [url (str api-host "/application/installation/" org-id "/token")
        jwt (token-request config)
        request {:headers (token-request-headers jwt uid)
                 :accept :json}]
    (->> (http/post url request)
         :body
         json-str->edn)))


(defprotocol TokenManager
  "Protocol to manage access tokens in a token store"
  (retrieve [this org-id uid]
    "Given an `org-id`, fetches the bot token associated to it. If a
    `uid` is passed, returns a token that when used, impersonates that
    user.")
  (store! [this org-id uid token expiry]
    "Given an `org-id`, this method stores the bot token and its
    expiry time in association with that org. If a `uid` is passed, the
    token is stored in a way that allows it to be associated with a user
    for impersonation.")
  (get-or-generate! [this org-id] [this org-id uid]
    "Fetches a token for the given org from the store if it exists and
    isn't expired, or generates a new one, stores it and retrieves it.
    If a `uid` is provided, it generates a token that can be used to
    impersonate that user."))


;; Do not print sensitive atom contents
(defmethod print-method :token-store [a ^java.io.Writer w]
  (.write w (str "#<" a ">")))


(defrecord AtomTokenManager [store config]
  TokenManager

  (retrieve [_ org-id uid]
    (if uid
      (get @store {:org-id org-id :uid uid})
      (get @store {:org-id org-id})))

  (store! [_ org-id uid token expiry]
    (if uid
      (swap! store assoc {:org-id org-id :uid uid} {:access-token token
                                                    :expires-at expiry})
      (swap! store assoc {:org-id org-id} {:access-token token
                                           :expires-at expiry})))

  (get-or-generate! [this org-id uid]
    (let [{:keys [access-token expires-at]} (retrieve this org-id uid)]
      (if (and access-token
               (not (t/before? (t/instant expires-at)
                               ;; Account for lag
                               (t/plus (t/instant) (t/seconds 30)))))
        access-token
        (let [{:keys [access-token expires-at]} (generate-token! config
                                                                 org-id
                                                                 uid)]
          (store! this org-id uid access-token expires-at)
          access-token))))

  (get-or-generate! [this org-id]
    (get-or-generate! this org-id nil)))

;;;;;;;;;;;;;;;;;;;;; Spec ;;;;;;;;;;;;;;;;;;;;;

(s/def ::api-host string?)
(s/def ::app-id number?)
(s/def ::private-key keys/private-key?)
(s/def ::store #(instance? clojure.lang.Atom %))
(s/def ::config (s/keys :req-un [::api-host ::app-id ::private-key]))
(s/fdef map->AtomTokenManager
  :args (s/cat :map (s/keys :req-un [::store ::config])))
(s/fdef ->AtomTokenManager
  :args (s/cat :store ::store :config ::config))

;; Use in development for troubleshooting
;; (st/instrument `map->AtomTokenManager)
;; (st/instrument `->AtomTokenManager)

;;;;;;;;;;;;;;;;;; End of Spec ;;;;;;;;;;;;;;;;;

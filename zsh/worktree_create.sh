worktree_name="$1"

# Source of profiles.clj files
profile_api_src="./envs/change_this0"
profile_app1_src="./envs/change_this1"
profile_app2_src="./envs/change_this2"

# Destination of profiles.clj files
profile_api_dest="./$worktree_name/change_this0"
profile_app1_dest="./$worktree_name/change_this1"
profile_app2_dest="./$worktree_name/change_this2"


# Create a worktree
git worktree add "$worktree_name"

# copy profiles.clj file of api
cp "$profile_api_src" "$profile_api_dest"

# copy profiles.clj file of pdf-aggregator
cp "$profile_app1_src" "$profile_app1_dest"

# copy profiles.clj file of pdf-worker
cp "$profile_app2_src" "$profile_app2_dest"

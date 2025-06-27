#!/usr/bin/env bash

# Start the API server
tmux new-window
tmux rename-windoow "api"
tmux send-keys "cd unifize-server/apps/api && lein repl" C-m
sleep 1
tmux send-keys "(go)" C-m

# Start unifize-web
tmux new-window
tmux rename-window "web"
tmux send-keys "cd unifize-web && npm start" C-m

# Start redis server
tmux new-window
tmux rename-window "redis"
tmux send-keys "redis-server" C-m

# Start Kafka and Debezium
tmux new-window
tmux rename-window "kafka"
# Start zookeeper
tmux send-keys "cd kafka_2.13-3.5.0" C-m
tmux send-keys " ./bin/zookeeper-server-start.sh config/zookeeper.properties" C-m
# Start kafka server
# But wait for 20 seconds for the Zookeeper server to start and become
# active.
sleep 20

tmux split-window -h
tmux send-keys "cd kafka_2.13-3.5.0" C-m
tmux send-keys "./bin/kafka-server-start.sh config/server.properties" C-m

# wait for seconds for the kafka server to start.
sleep 10
tmux split-window -h
tmux send-keys "cd kafka_2.13-3.5.0" C-m
tmux send-keys " ./bin/connect-standalone.sh config/connect-standalone.properties config/debezium.properties"

# Now that Redis and Kafka is running, let's start budgie and xtdb

# XTDB
tmux new-window
tmux rename-window "xtdb"
tmux send-keys "cd unifize-server/apps/xtdb-builder && lein repl" C-m
sleep 1
tmux send-keys "(go)" C-m

tmux split-window -h
tmux send-keys "cd unifize-server/apps/xtdb-processor && lein repl" C-m
sleep 1
tmux send-keys "(go)" C-m

# Budgie
tmux new-window
tmux rename-window "budige"
tmux send-keys "cd unifize-server/apps/budgie" C-m
tmux send-keys "lein with-profile +worker repl" C-m
sleep 1
tmux send-keys "(go)" C-m

tmux split-window -h
tmux send-keys "cd unifize-server/apps/budgie" C-m
tmux send-keys "lein with-profile +api repl"
sleep 1
tmux send-keys "(go)" C-m

# Start Petrel
tmux new-window
tmux rename-window "petrel"
tmux send-keys "cd petrel" C-m
tmux send-keys "source ./bin/activate" C-m
tmux send-keys "uvicorn main:app --reload"

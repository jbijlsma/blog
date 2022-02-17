#!/bin/bash

CLIENT_TAG=localhost:5001/blog-client:latest
docker build -t $CLIENT_TAG -f ./client/Dockerfile  ./client
docker push $CLIENT_TAG

COMMENTS_TAG=localhost:5001/blog-comments:latest
docker build -t $COMMENTS_TAG -f ./comments/Dockerfile  ./comments
docker push $COMMENTS_TAG

EVENT_BUS_TAG=localhost:5001/blog-event-bus:latest
docker build -t $EVENT_BUS_TAG -f ./event-bus/Dockerfile  ./event-bus
docker push $EVENT_BUS_TAG

MODERATION_TAG=localhost:5001/blog-moderation:latest
docker build -t $MODERATION_TAG -f ./moderation/Dockerfile  ./moderation
docker push $MODERATION_TAG

POSTS_TAG=localhost:5001/blog-posts:latest
docker build -t $POSTS_TAG -f ./posts/Dockerfile  ./posts
docker push $POSTS_TAG

QUERY_TAG=localhost:5001/blog-query:latest
docker build -t $QUERY_TAG -f ./query/Dockerfile  ./query
docker push $QUERY_TAG
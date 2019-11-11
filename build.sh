#!/bin/bash
docker build -t jmeritt/sabnzbd --no-cache .
docker push jmeritt/sabnzbd
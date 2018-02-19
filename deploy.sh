#!/bin/bash
TERM="vt100"
export TERM

DL=$(printenv DOCKER_USER)
DP=$(printenv DOCKER_PW)
DR=$(printenv DOCKER_REG)

echo "$DL"
echo "$DP"

docker login -u "$DL" -p "$DP" $DR

/sbin/tini -- /usr/local/bin/jenkins.sh

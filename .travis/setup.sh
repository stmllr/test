#!/bin/bash

BUILD_CONTEXT="dev" 

echo -e "\n========================================"
echo -e "\n Working on branch: ${TRAVIS_BRANCH}"
echo -e "\n Pull request: ${TRAVIS_PULL_REQUEST}"
echo -e "\n========================================"


# If this is fork - just exit
#if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false" ]]; then
#	echo -e '\n============== deploy will not be started (from the fork) ==============\n'
#	exit 0
#fi

#if [ ${TRAVIS_BRANCH} == "master" ]; then
#	BUILD_CONTEXT="production"
#else
#	BUILD_CONTEXT="dev"
#fi
#
#export BUILD_CONTEXT
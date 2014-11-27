#!/bin/bash

BUILD_CONTEXT="dev" 


echo -e "\n========================================"
echo -e "\n Working on branch: ${TRAVIS_BRANCH}"
echo -e "\n Pull request env: ${TRAVIS_PULL_REQUEST}"
if [[ "${TRAVIS_PULL_REQUEST}" != "false" ]]; then
	echo -e "\n ... triggered by a pull request"
fi
echo -e "\n========================================"


# If this is fork - just exit
#if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false" ]]; then
#fi

if [ ${TRAVIS_BRANCH} == "master" ]; then
	BUILD_COMMAND="grunt production"
else
	BUILD_COMMAND="grunt dev"
fi

export BUILD_COMMAND


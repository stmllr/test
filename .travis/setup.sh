#!/bin/bash

echo -e "\n========================================"
echo -e "\n Working on branch: ${TRAVIS_BRANCH}"


# Make a test build, if this is a pull request or a different branch than master
if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false" && ${TRAVIS_BRANCH} == "master" ]]; then
	GRUNT_COMMAND="build-test"
	echo -e "\n Creating a test build for pull request ${TRAVIS_REPO_SLUG}#${TRAVIS_PULL_REQUEST}"
elif [[ ${TRAVIS_BRANCH} == "master" ]]; then
	GRUNT_COMMAND="build-production"
	echo -e "\n Creating a production build."
else
	echo -e "\n Creating a dev build."
	GRUNT_COMMAND="dev"
fi

echo -e "\n========================================"

export GRUNT_COMMAND
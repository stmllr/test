#!/bin/bash

echo -e "\n========================================"
echo -e "\n Working on branch: ${TRAVIS_BRANCH}"


# Make a test build, if this is a pull request or a different branch than master
if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false" && ${TRAVIS_BRANCH} == "master" ]]; then
	echo -e "\n Creating a test build for pull request ${TRAVIS_REPO_SLUG}#${TRAVIS_PULL_REQUEST}"
	GRUNT_COMMAND="build-test"
# Make a production build, if ithis is a commit to master branch (incl. merge of pull requests)
elif [[ ${TRAVIS_BRANCH} == "master" ]]; then
	echo -e "\n Creating a production build."
	GRUNT_COMMAND="build-production"
# Anything else is dev
else
	echo -e "\n Creating a dev build."
	GRUNT_COMMAND="dev"
fi

echo -e "\n========================================"

echo -e "\n Executing \$grunt ${GRUNT_COMMAND} --verbose"
grunt ${GRUNT_COMMAND} --verbose

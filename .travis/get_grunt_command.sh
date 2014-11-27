#!/bin/bash

if [[ -n "${TRAVIS_PULL_REQUEST}" && "${TRAVIS_PULL_REQUEST}" != "false" && ${TRAVIS_BRANCH} == "master" ]]; then
	echo "build-test"
elif [[ ${TRAVIS_BRANCH} == "master" ]]; then
	echo "build-production"
else
	echo "dev"
fi


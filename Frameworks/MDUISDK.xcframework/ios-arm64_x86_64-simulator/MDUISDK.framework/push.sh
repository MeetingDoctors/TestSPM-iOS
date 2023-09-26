#!/bin/bash

set -e

# Allow use the script from terminal, script must be called from folder containing the push.sh script.
if [ -z "$SRCROOT" ]
then
        SRCROOT="`pwd`/Application"
        echo "SCROOT: ${SCROOT}"
fi

# Setup some constants for use later on.
export LANG=en_US.UTF-8

ROOT_FOLDER="${SRCROOT}/.."
REPO_NAME="meetingdoctors"

# Push directory
pushd "${ROOT_FOLDER}"

# Wait for Bintray to process binary publication
/bin/sleep 30

echo "[MDSDK] push start"

arch -x86_64 pod repo update
arch -x86_64 pod ipc spec MDUISDK.podspec
arch -x86_64 pod repo push ${REPO_NAME} --allow-warnings --use-json --verbose MDUISDK.podspec

echo "[MDSDK] push end"

# Pop directory
popd

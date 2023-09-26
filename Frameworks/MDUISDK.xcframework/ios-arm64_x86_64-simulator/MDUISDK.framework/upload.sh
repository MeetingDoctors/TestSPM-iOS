#!/bin/sh

# Set bash script to exit immediately if any commands fail.
set -e

# Define script environment variables
    PRODUCT_BUILD="${CURRENT_PROJECT_VERSION}"
    if [ -n "${XCS_INTEGRATION_NUMBER}" ]; then
    PRODUCT_BUILD="${XCS_INTEGRATION_NUMBER}"
    fi

# Allow use the script from terminal, script must be called from folder containing the upload.sh script.
    if [ -z "$SRCROOT" ]
    then
            SRCROOT="`pwd`/Application"
            echo "SCROOT: ${SCROOT}"
    fi
    
    if [ -z "$CONFIGURATION" ]
    then
        CONFIGURATION="Release"
    fi
    
    if [ -z "$MEETINGDOCTORS_SDK_VERSION" ]
    then
        MEETINGDOCTORS_SDK_VERSION="`grep -n "MEETINGDOCTORS_SDK_VERSION" "${SRCROOT}/../MeetingDoctors/MeetingDoctors/Resource/Config/Config-release.xcconfig" | cut -d'=' -f2 | tr -d ' '`"
    fi
    
    echo "$MEETINGDOCTORS_SDK_VERSION"
    
    if [ -z "$MEETINGDOCTORS_SDK_QUALIFIER" ]
    then
        MEETINGDOCTORS_SDK_QUALIFIER="`grep -n "MEETINGDOCTORS_SDK_QUALIFIER" "${SRCROOT}/../MeetingDoctors/MeetingDoctors/Resource/Config/Config-release.xcconfig" | cut -d'=' -f2 | tr -d ' '`"
    fi

# Setup some constants for use later on.
ROOT_FOLDER="${SRCROOT}/.."
PRODUCT_VERSION="${MEETINGDOCTORS_SDK_VERSION}${MEETINGDOCTORS_SDK_QUALIFIER}"
BUILD_OUTPUTFOLDER="${ROOT_FOLDER}/Framework"
PRODUCT_OUTPUTFOLDER="${BUILD_OUTPUTFOLDER}/Build/Products"
UNIVERSAL_OUTPUTFOLDER="${PRODUCT_OUTPUTFOLDER}/${CONFIGURATION}-universal"
BINARY_OUTPUTFOLDER="${PRODUCT_OUTPUTFOLDER}/MeetingDoctors"
AWS_PROFILE="sdk-download-meetingdoctors"
BUCKET_NAME="sdk-download-meetingdoctors"
BUCKET_FOLDER="iOS/MDUISDK"

# Push directory
pushd "${PRODUCT_OUTPUTFOLDER}"

echo "[MDSDK] Upload start"

for FRAMEWORK in "${UNIVERSAL_OUTPUTFOLDER}"/*.xcframework/; do
    FILE_NAME=$(basename "$FRAMEWORK")

    # Pre Zip
    mkdir -p "${BINARY_OUTPUTFOLDER}"
    cp -R "${UNIVERSAL_OUTPUTFOLDER}/${FILE_NAME}" "${BINARY_OUTPUTFOLDER}"
done

PRODUCT_OUTPUTFILE="MDUISDK_${PRODUCT_VERSION}"

echo "[MDSDK] Zip start"

# Zip
echo "Zip framework output version ${PRODUCT_VERSION} #${PRODUCT_BUILD}"
zip -r "${PRODUCT_OUTPUTFILE}.zip" "MeetingDoctors/"


# Post Zip
rm -rf "${BINARY_OUTPUTFOLDER}"

echo "[MDSDK] Zip end"

echo "[MDSDK] Copy folder content of: ${PRODUCT_OUTPUTFOLDER}/${PRODUCT_OUTPUTFILE}.zip"

## Copy the files and folders to S3 bucket
aws s3 cp "${PRODUCT_OUTPUTFOLDER}/${PRODUCT_OUTPUTFILE}.zip" "s3://$BUCKET_NAME/$BUCKET_FOLDER/${PRODUCT_VERSION}/"  --profile ${AWS_PROFILE}

# Wait for Bintray to process binary upload
/bin/sleep 30

echo "[MDSDK] Upload end"

# Pop directory
popd


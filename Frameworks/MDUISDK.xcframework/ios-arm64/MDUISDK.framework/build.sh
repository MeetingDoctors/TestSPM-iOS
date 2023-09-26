#!/bin/sh

# Set bash script to exit immediately if any commands fail.
set -e
set -o pipefail

if [ "true" == ${ALREADYINVOKED:-false} ]; then

    echo "RECURSION: Detected, stopping"

else
    
    export ALREADYINVOKED="true"
    
    # Allow use the script from terminal, script must be called from folder containing the build.sh script.
    if [ -z "$SRCROOT" ]
    then
        SRCROOT="`pwd`/Application"
        echo "SCROOT: ${SCROOT}"
    fi
    if [ -z "$CONFIGURATION" ]
    then
        CONFIGURATION="Release"
    fi
    
    echo "[MDSDK] Build start"
    
    echo "`pwd`/Application"
    
    # Setup some constants for use later on.
    ROOT_FOLDER="${SRCROOT}/.."
    BUILD_OUTPUTFOLDER="${ROOT_FOLDER}/Framework/"
    BUILD_IOS="${BUILD_OUTPUTFOLDER}MDUISDK.framework-iphoneos.xcarchive"
    BUILD_SIMULATOR="${BUILD_OUTPUTFOLDER}MDUISDK.framework-iphonesimulator.xcarchive"
    BUILD_FRAMEWORKS_IOS="${BUILD_IOS}/Products/Library/Frameworks/"
    BUILD_DSYM_IOS="${BUILD_IOS}/dSYMs/"
    BUILD_FRAMEWORKS_SIMULATOR="${BUILD_SIMULATOR}/Products/Library/Frameworks/"
    BUILD_DSYM_SIMULATOR="${BUILD_SIMULATOR}/dSYMs/"
    
    PRODUCT_OUTPUTFOLDER="${BUILD_OUTPUTFOLDER}/Build/Products"
    UNIVERSAL_OUTPUTFOLDER="${PRODUCT_OUTPUTFOLDER}/${CONFIGURATION}-universal"
    
    # If remnants from a previous build exist, delete them.
    echo "[MDSDK] Delete previous build remnants"
    if [ -d "${BUILD_OUTPUTFOLDER}" ]; then
        rm -rf "${BUILD_OUTPUTFOLDER}"
    fi

    # make sure the output directories exist
    mkdir -p "${PRODUCT_OUTPUTFOLDER}"
    mkdir -p "${UNIVERSAL_OUTPUTFOLDER}"

    # Clean workspace
    echo "[MDSDK] Clean workspace"
    xcodebuild \
        -workspace "${ROOT_FOLDER}/MeetingDoctorsUI.xcworkspace" \
        -scheme "MDUISDK" clean
    
    # Build for iPhone device
    echo "[MDSDK] Build for device"
    xcodebuild archive \
        -workspace "${ROOT_FOLDER}/MeetingDoctorsUI.xcworkspace" \
        -scheme MDUISDK \
        -configuration "${CONFIGURATION}" \
        -sdk iphoneos \
        -destination 'generic/platform=iOS' \
        -archivePath "${BUILD_IOS}" \
        -derivedDataPath "${BUILD_OUTPUTFOLDER}/DerivedData" \
        SKIP_INSTALL=NO \
        BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
    
    # Build for iPhone Simulator
    echo "[MDSDK] Build for simulator"
    xcodebuild archive \
        -workspace "${ROOT_FOLDER}/MeetingDoctorsUI.xcworkspace" \
        -scheme MDUISDK \
        -configuration "${CONFIGURATION}" \
        -sdk iphonesimulator \
        -destination 'generic/platform=iOS Simulator' \
        -archivePath "${BUILD_SIMULATOR}" \
        -derivedDataPath "${BUILD_OUTPUTFOLDER}/DerivedData" \
        SKIP_INSTALL=NO \
        BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
    
    echo "[MDSDK] Generate Frameworks"
    for FRAMEWORK in "${BUILD_FRAMEWORKS_IOS}"/MD*.framework/; do
        FILE_NAME=$(basename "$FRAMEWORK")
        BINARY_NAME="${FILE_NAME%.*}"

        XCFRAMEWORK_NAME="${UNIVERSAL_OUTPUTFOLDER}/${BINARY_NAME}.xcframework"
        
        xcodebuild -create-xcframework \
            -framework "${BUILD_FRAMEWORKS_IOS}${FILE_NAME}" \
            -framework "${BUILD_FRAMEWORKS_SIMULATOR}${FILE_NAME}" \
            -output "${XCFRAMEWORK_NAME}"
    done
    
    echo "[MDSDK] Build end"
fi

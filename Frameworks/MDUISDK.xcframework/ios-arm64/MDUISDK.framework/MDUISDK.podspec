#!/usr/bin/ruby

Pod::Spec.new do |spec|
    spec.name = 'MDUISDK'
    spec.version = "1.0.0-beta.1"
    spec.summary = 'MDUISDK Framework for iOS'
    spec.authors = { "MeetingDoctors, S.L." => "info@meetingdoctors.com" }
    spec.license = { :type => 'Copyright', :text => 'Copyright © 2022 MeetingDoctors S.L. All rights reserved.' }
    spec.source = { :http => "https://sdk-download.meetingdoctors.com/iOS/MDUISDK/#{spec.version}/MDUISDK_#{spec.version}.zip" }
    spec.homepage = 'https://www.meetingdoctors.com'
    spec.ios.deployment_target = '13.0'
    spec.platform = :ios, '13.0'
    spec.swift_version = '5.7'

    spec.module_name = 'MDUISDK'
    spec.ios.frameworks = ['Foundation', 'UIKit', 'SwiftUI']
    spec.ios.vendored_frameworks = 'MeetingDoctors/MDUISDK.xcframework'
end

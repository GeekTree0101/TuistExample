//
//  InfoPlist.swift
//  ProjectDescriptionHelpers
//
//  Created by Geektree0101 on 2021/01/23.
//

import ProjectDescription

public struct InfoPlistFactory {

  public init() {

  }
  
  public func build() -> [String: InfoPlist.Value] {
    // TODO

    return [
      "CFBundleShortVersionString": "1.0",
      "CFBundleVersion": "1",
      "UIMainStoryboardFile": "",
      "UILaunchStoryboardName": "LaunchScreen"
    ]
  }
}

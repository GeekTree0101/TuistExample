//
//  Carthage.swift
//  ProjectDescriptionHelpers
//
//  Created by Geektree0101 on 2021/01/23.
//

import ProjectDescription

public struct CarthageFactory {

  public enum Platform: String {
    case iOS
  }

  public struct Payload {

    let dependencyNames: [String]
    let platform: Platform
    let buildPath: String

    public init(dependencyNames: [String], platform: Platform, buildPath: String) {
      self.dependencyNames = dependencyNames
      self.platform = platform
      self.buildPath = buildPath
    }
  }

  public init() { }

  public func build(payload: Payload) -> [TargetDependency] {

    return payload.dependencyNames.map { name in
      return .framework(
        path: .relativeToRoot(
          "\(payload.buildPath)/\(payload.platform.rawValue)/\(name).framework"
        )
      )
    }
  }

}

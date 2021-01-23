//
//  App.swift
//  ProjectDescriptionHelpers
//
//  Created by Geektree0101 on 2021/01/23.
//

import ProjectDescription

public struct AppFactory {

  public struct Dependency {
    
    let appDependencies: [TargetDependency]
    let unitTestsDependencies: [TargetDependency]

    public init(appDependencies: [TargetDependency],
                unitTestsDependencies: [TargetDependency]) {

      self.appDependencies = appDependencies
      self.unitTestsDependencies = unitTestsDependencies
    }
  }

  public struct Payload {

    let bundleID: String
    let name: String
    let platform: Platform
    let infoPlist: [String: InfoPlist.Value]

    public init(bundleID: String,
                name: String,
                platform: Platform,
                infoPlist: [String: InfoPlist.Value]) {
      self.bundleID = bundleID
      self.name = name
      self.platform = platform
      self.infoPlist = infoPlist
    }
  }

  private let dependency: Dependency

  public init(dependency: Dependency) {
    self.dependency = dependency
  }

  public func build(payload: Payload) -> [Target] {

    let mainTarget = Target(
      name: payload.name,
      platform: payload.platform,
      product: .app,
      bundleId: payload.bundleID,
      infoPlist: .extendingDefault(with: payload.infoPlist),
      sources: ["Targets/\(payload.name)/Sources/**"],
      resources: ["Targets/\(payload.name)/Resources/**"],
      dependencies: self.dependency.appDependencies
    )

    let testTarget = Target(
      name: "\(payload.name)Tests",
      platform: payload.platform,
      product: .unitTests,
      bundleId: payload.bundleID,
      infoPlist: .default,
      sources: ["Targets/\(payload.name)/Tests/**"],
      dependencies: [.target(name: "\(payload.name)")]
        + self.dependency.unitTestsDependencies
    )

    return [mainTarget, testTarget]
  }
}

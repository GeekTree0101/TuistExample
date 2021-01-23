//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Geektree0101 on 2021/01/23.
//

import ProjectDescription

public struct ProjectFactory {

  public struct Dependency {

    let appTargets: [Target]
    let frameworkTargets: [Target]

    public init(appTargets: [Target], frameworkTargets: [Target]) {
      self.appTargets = appTargets
      self.frameworkTargets = frameworkTargets
    }
  }

  public struct Payload {

    let name: String
    let organizationName: String

    public init(name: String, organizationName: String) {
      self.name = name
      self.organizationName = organizationName
    }
  }

  private let dependency: Dependency

  public init(dependency: Dependency) {
    self.dependency = dependency
  }

  public func build(payload: Payload) -> Project {

    return Project(
      name: payload.name,
      organizationName: payload.organizationName,
      targets: self.dependency.appTargets + self.dependency.frameworkTargets
    )
  }
}

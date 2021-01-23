import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Prop

let appName: String = "Vingle"
let carthageBuildPath = "Carthage/Build"

// MARK: - Dependeny

let uiDependencies: [TargetDependency] = CarthageFactory().build(
  payload: CarthageFactory.Payload(
    dependencyNames: [
      "AsyncDisplayKit",
      "RxSwift",
      "RxCocoa",
      "RxRelay"
    ],
    platform: .iOS,
    buildPath: carthageBuildPath
  )
)

let utilDependencies: [TargetDependency] = CarthageFactory().build(
  payload: CarthageFactory.Payload(
    dependencyNames: [],
    platform: .iOS,
    buildPath: carthageBuildPath
  )
)

let unitTestDependencies: [TargetDependency] = CarthageFactory().build(
  payload: CarthageFactory.Payload(
    dependencyNames: [
      "Nimble",
      "RxTest",
      "RxBlocking"
    ],
    platform: .iOS,
    buildPath: carthageBuildPath
  )
)

let coreDependencies: [TargetDependency] = [
  .target(name: "VingleUI"),
  .target(name: "VingleFoundation")
]

// MARK: - Target

let uiTargets: [Target] = FrameworkFactory(
  dependency: FrameworkFactory.Dependency(
    frameworkDependencies: uiDependencies,
    unitTestsDependencies: unitTestDependencies
  )
)
.build(
  payload: FrameworkFactory.Payload(
    name: "VingleUI",
    platform: .iOS
  )
)

let foundationTargets: [Target] = FrameworkFactory(
  dependency: FrameworkFactory.Dependency(
    frameworkDependencies: utilDependencies,
    unitTestsDependencies: unitTestDependencies
  )
)
.build(
  payload: FrameworkFactory.Payload(
    name: "VingleFoundation",
    platform: .iOS
  )
)

let appTargets: [Target] = AppFactory(
  dependency: AppFactory.Dependency(
    appDependencies: coreDependencies
      + uiDependencies
      + utilDependencies,
    unitTestsDependencies: unitTestDependencies
  )
).build(
  payload: AppFactory.Payload(
    bundleID: "com.vingle.www",
    name: appName,
    platform: .iOS,
    infoPlist: InfoPlistFactory().build()
  )
)


// MARK: - Project

let project = ProjectFactory(
  dependency: ProjectFactory.Dependency(
    appTargets: appTargets,
    frameworkTargets: uiTargets + foundationTargets
  )
).build(
  payload: ProjectFactory.Payload(
    name: appName,
    organizationName: "vingle.inc"
  )
)

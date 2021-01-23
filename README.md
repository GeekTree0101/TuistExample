# Tuist Example Project

# construction process

### install
```sh
bash <(curl -Ls https://install.tuist.io)
```

### Create a project
```sh
mkdir PROJECT_NAME
cd PROJECT_NAME
tuist init --platform ios
```

- Tuist
  - ProjectDescriptionHelpers
    - Project+Templates.swift // <- I deleted this file 
    - App.swift // AppTargets factory (return main + unittest target)
    - Project.swift // Project factory (return project)
    - Framework.swift // FrameworkTargets factory (return main + unittest target)
    - Carthage.swift // carthage dependencies factory (return array of TargetDependency)
  - Config.swift
- Project.swift

### Create specification for project configuration in Project.swift
https://github.com/GeekTree0101/TuistExample/blob/master/Project.swift

### Create a Xcode project files
```sh
tuist generate
```

--project-only : Only generate the local project (without generating its dependencies)

```sh
tuist generate --project-only
```

and 

enjoy :)

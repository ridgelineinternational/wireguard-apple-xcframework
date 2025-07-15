# [WireGuard](https://www.wireguard.com/) for iOS and macOS (with XCFramework universal build)

This project contains an application for iOS and for macOS, as well as many components shared between the two of them. The xcframework library is compatible with iOS, macOS, and should at least link with the simulator (there may be network extension limitations, but minimal simulator dev should be possible).

## Building

(This section has not been updated since the xcframework introduction. These instructions will likely change - the project probably needs updating for pointing to the right spm project version and since the package is pre built, there's no need to install `go`)

- Clone this repo:

```
$ git clone https://git.zx2c4.com/wireguard-apple
$ cd wireguard-apple
```

- Rename and populate developer team ID file:

```
$ cp Sources/WireGuardApp/Config/Developer.xcconfig.template Sources/WireGuardApp/Config/Developer.xcconfig
$ vim Sources/WireGuardApp/Config/Developer.xcconfig
```

- Install swiftlint and go 1.19:

```
$ brew install swiftlint go
```

- Open project in Xcode:

```
$ open WireGuard.xcodeproj
```

- Flip switches, press buttons, and make whirling noises until Xcode builds it.

## WireGuardKit integration

It should now be as simple as adding this SPM package as a dependency. The magic behind this is that the package is pre-built as an xcframework, now, however. If you cannot trust a third party binary, you're welcome to build it yourself.

To do so

(Building with GitHub Actions)
1. Fork this project
1. In your fork, go to Actions
1. Choose the "Go Dependency Wrapper" action
1. On the right side of the screen, you should see `Run workflow` - do that.
1. The option to run `go get -u` as part of the build process is presented (this will update the build to use the latest wireguard go upstream code)
1. Provide a name for the tag. Semantic versioning is suggested, but not required.
1. Press `Run Workflow`
1. In a couple minutes, you'll have a new release on your fork that is freshly built.
1. You can now reference your fork with your release tag version in your own iOS/macOS project.

While this might not strictly feel quite the same as building locally, you are completely capable of instpecting the code as this entire repo is transparent.

And if you want to build locally, that's also an option. If you need assistance, the best path forward would be to inspect the workflow yaml file and replicate the steps on your local Mac.

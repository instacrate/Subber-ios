<p align="center"><img src="https://cloud.githubusercontent.com/assets/1567433/13918338/f8670eea-ef7f-11e5-814d-f15bdfd6b2c0.png" height="180"/>

<p align="center">
<a href="https://cocoapods.org"><img src="https://img.shields.io/cocoapods/v/Nuke-Alamofire-Plugin.svg"></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
</p>

[Alamofire](https://github.com/Alamofire/Alamofire) plugin for [Nuke](https://github.com/kean/Nuke) that allows you to use Alamofire for networking.

## Usage

The plugin adds a `DataLoader` class that uses `Alamofire.SessionManager` for networking.

```swift
let loader = Nuke.Loader(loader: NukeAlamofirePlugin.DataLoader(), decoder: Nuke.DataDecoder(), cache: Cache.shared)
let manager = Nuke.Manager(loader: loader, cache: Cache.shared)

manager.loadImage(with: url, into: imageView)
```

## Installation

### [CocoaPods](http://cocoapods.org)

To install plugin add a dependency to your Podfile:

```ruby
# source 'https://github.com/CocoaPods/Specs.git'
# use_frameworks!
# platform :ios, "9.0" / :watchos, "2.0" / :osx, "10.11" / :tvos, "9.0"

pod "Nuke-Alamofire-Plugin"
```

### [Carthage](https://github.com/Carthage/Carthage)

To install plugin add a dependency to your Cartfile:

```
github "kean/Nuke-Alamofire-Plugin"
```

## Requirements
- iOS 9.0 / macOS 10.11 / watchOS 2.0 / tvOS 9.0
- Xcode 8
- Swift 3

## Dependencies
- [Nuke 4](https://github.com/kean/Nuke)
- [Alamofire 4](https://github.com/Alamofire/Alamofire)

## License

Nuke is available under the MIT license. See the LICENSE file for more info.
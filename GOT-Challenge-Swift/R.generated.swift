//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  static func validate() throws {
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `data.json`.
    static let dataJson = Rswift.FileResource(bundle: R.hostingBundle, name: "data", pathExtension: "json")

    /// `bundle.url(forResource: "data", withExtension: "json")`
    static func dataJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dataJson
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `launchscreen`.
    static let launchscreen = Rswift.ImageResource(bundle: R.hostingBundle, name: "launchscreen")
    /// Image `placeholder-image10`.
    static let placeholderImage10 = Rswift.ImageResource(bundle: R.hostingBundle, name: "placeholder-image10")

    /// `UIImage(named: "launchscreen", bundle: ..., traitCollection: ...)`
    static func launchscreen(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.launchscreen, compatibleWith: traitCollection)
    }

    /// `UIImage(named: "placeholder-image10", bundle: ..., traitCollection: ...)`
    static func placeholderImage10(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.placeholderImage10, compatibleWith: traitCollection)
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `CharacterCell`.
    static let characterCell: Rswift.ReuseIdentifier<CharacterTableViewCell> = Rswift.ReuseIdentifier(identifier: "CharacterCell")

    fileprivate init() {}
  }

  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }

  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `GOT`.
    static let gOT = _R.storyboard.gOT()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    /// `UIStoryboard(name: "GOT", bundle: ...)`
    static func gOT(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.gOT)
    }

    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }

  struct nib {
    fileprivate init() {}
  }

  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try gOT.validate()
      try launchScreen.validate()
    }

    struct gOT: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let characterDetailViewController = StoryboardViewControllerResource<CharacterDetailViewController>(identifier: "CharacterDetailViewController")
      let charactersViewController = StoryboardViewControllerResource<CharactersViewController>(identifier: "CharactersViewController")
      let name = "GOT"

      func characterDetailViewController(_: Void = ()) -> CharacterDetailViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: characterDetailViewController)
      }

      func charactersViewController(_: Void = ()) -> CharactersViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: charactersViewController)
      }

      static func validate() throws {
        if _R.storyboard.gOT().charactersViewController() == nil { throw Rswift.ValidationError(description: "[R.swift] ViewController with identifier 'charactersViewController' could not be loaded from storyboard 'GOT' as 'CharactersViewController'.") }
        if _R.storyboard.gOT().characterDetailViewController() == nil { throw Rswift.ValidationError(description: "[R.swift] ViewController with identifier 'characterDetailViewController' could not be loaded from storyboard 'GOT' as 'CharacterDetailViewController'.") }
      }

      fileprivate init() {}
    }

    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if UIKit.UIImage(named: "launchscreen") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'launchscreen' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate init() {}
}

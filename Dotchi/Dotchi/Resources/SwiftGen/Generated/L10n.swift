// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  /// Update bundle if you need to change app language
  static var bundle: Bundle?

  enum InfoPlist {
    /// Portal needs access to your camera.
    static var nsCameraUsageDescription: String {
      return L10n.tr("InfoPlist", "NSCameraUsageDescription")
    }
    /// Portal needs access to your location.
    static var nsLocationWhenInUseUsageDescription: String {
      return L10n.tr("InfoPlist", "NSLocationWhenInUseUsageDescription")
    }
    /// Data we collect will be used to improve the application and fixing bugs.
    static var nsUserTrackingUsageDescription: String {
      return L10n.tr("InfoPlist", "NSUserTrackingUsageDescription")
    }
  }
  enum Localizable {

    enum CreateAccountError {

      enum ApplicationError {
        /// Server error. Try again later.
        static var description: String {
          return L10n.tr("Localizable", "CreateAccountError.ApplicationError.Description")
        }
      }

      enum ConnectionError {
        /// Connection error. Check your internet connection.
        static var description: String {
          return L10n.tr("Localizable", "CreateAccountError.ConnectionError.Description")
        }
      }

      enum DataSourceError {
        /// Application error. Try again later.
        static var description: String {
          return L10n.tr("Localizable", "CreateAccountError.DataSourceError.Description")
        }
      }

      enum WrongCredentials {
        /// Wrong email or password.
        static var description: String {
          return L10n.tr("Localizable", "CreateAccountError.WrongCredentials.Description")
        }
      }
    }

    enum DataError {

      enum ApplicationError {
        /// Oops! There was an application error, please report a bug or try again later.
        static var description: String {
          return L10n.tr("Localizable", "DataError.ApplicationError.Description")
        }
      }

      enum ConnectionError {
        /// It looks like there was a connection error. Please check your internet connection or try again later.
        static var description: String {
          return L10n.tr("Localizable", "DataError.ConnectionError.Description")
        }
      }

      enum DataSourceError {
        /// We are sorry... There was a connection error from our side, please report a bug or try again later.
        static var description: String {
          return L10n.tr("Localizable", "DataError.DataSourceError.Description")
        }
      }

      enum EmptyData {
        /// We could not find anything.
        static var description: String {
          return L10n.tr("Localizable", "DataError.EmptyData.Description")
        }
      }
    }

    enum General {
      /// Cancel
      static var cancel: String {
        return L10n.tr("Localizable", "General.Cancel")
      }
      /// Close
      static var close: String {
        return L10n.tr("Localizable", "General.Close")
      }
      /// Device
      static var device: String {
        return L10n.tr("Localizable", "General.Device")
      }
      /// OK
      static var ok: String {
        return L10n.tr("Localizable", "General.OK")
      }
      /// Oops!
      static var oops: String {
        return L10n.tr("Localizable", "General.Oops")
      }
      /// Version
      static var version: String {
        return L10n.tr("Localizable", "General.Version")
      }
    }

    enum Language {
      /// Danish
      static var danish: String {
        return L10n.tr("Localizable", "Language.Danish")
      }
      /// English
      static var english: String {
        return L10n.tr("Localizable", "Language.English")
      }
      /// Polish
      static var polish: String {
        return L10n.tr("Localizable", "Language.Polish")
      }
    }

    enum LoginError {

      enum ApplicationError {
        /// Server error. Try again later.
        static var description: String {
          return L10n.tr("Localizable", "LoginError.ApplicationError.Description")
        }
      }

      enum ConnectionError {
        /// Connection error. Check your internet connection.
        static var description: String {
          return L10n.tr("Localizable", "LoginError.ConnectionError.Description")
        }
      }

      enum DataSourceError {
        /// Application error. Try again later.
        static var description: String {
          return L10n.tr("Localizable", "LoginError.DataSourceError.Description")
        }
      }

      enum InvalidCredentials {
        /// Wrong email or password.
        static var description: String {
          return L10n.tr("Localizable", "LoginError.InvalidCredentials.Description")
        }
      }
    }

    enum PermissionView {
      /// Allow
      static var allow: String {
        return L10n.tr("Localizable", "PermissionView.Allow")
      }
      /// Not now
      static var notNow: String {
        return L10n.tr("Localizable", "PermissionView.NotNow")
      }

      enum Description {
        /// Allow app tracking.
        static var appTracking: String {
          return L10n.tr("Localizable", "PermissionView.Description.AppTracking")
        }
        /// Allow access to the camera.
        static var camera: String {
          return L10n.tr("Localizable", "PermissionView.Description.Camera")
        }
        /// Allow access to the location.
        static var location: String {
          return L10n.tr("Localizable", "PermissionView.Description.Location")
        }
        /// Allow acces to the push notifications
        static var pushNotifications: String {
          return L10n.tr("Localizable", "PermissionView.Description.PushNotifications")
        }
      }

      enum Title {
        /// App Tracking
        static var appTracking: String {
          return L10n.tr("Localizable", "PermissionView.Title.AppTracking")
        }
        /// Camera Access
        static var camera: String {
          return L10n.tr("Localizable", "PermissionView.Title.Camera")
        }
        /// Location Access
        static var location: String {
          return L10n.tr("Localizable", "PermissionView.Title.Location")
        }
        /// Push Notifications
        static var pushNotifications: String {
          return L10n.tr("Localizable", "PermissionView.Title.PushNotifications")
        }
      }
    }

    enum Portal {
      /// Portal
      static var name: String {
        return L10n.tr("Localizable", "Portal.Name")
      }
    }

    enum ResetPasswordError {

      enum ApplicationError {
        /// Server error. Try again later.
        static var description: String {
          return L10n.tr("Localizable", "ResetPasswordError.ApplicationError.Description")
        }
      }

      enum ConnectionError {
        /// Connection error. Check your internet connection.
        static var description: String {
          return L10n.tr("Localizable", "ResetPasswordError.ConnectionError.Description")
        }
      }

      enum DataSourceError {
        /// Application error. Try again later.
        static var description: String {
          return L10n.tr("Localizable", "ResetPasswordError.DataSourceError.Description")
        }
      }

      enum InvalidEmail {
        /// Wrong email.
        static var description: String {
          return L10n.tr("Localizable", "ResetPasswordError.InvalidEmail.Description")
        }
      }
    }

    enum SearchBar {
      /// Cancel
      static var cancel: String {
        return L10n.tr("Localizable", "SearchBar.Cancel")
      }
      /// Search
      static var search: String {
        return L10n.tr("Localizable", "SearchBar.Search")
      }
    }

    enum TabBarViewController {
      /// Browse
      static var browse: String {
        return L10n.tr("Localizable", "TabBarViewController.Browse")
      }
    }

    enum Theme {
      /// Dark
      static var dark: String {
        return L10n.tr("Localizable", "Theme.Dark")
      }
      /// Light
      static var light: String {
        return L10n.tr("Localizable", "Theme.Light")
      }
      /// System
      static var system: String {
        return L10n.tr("Localizable", "Theme.System")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: bundle ?? Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

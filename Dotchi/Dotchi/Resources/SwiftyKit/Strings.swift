//
//  PortalStrings.swift
//  Portal
//
//  Created by Greg Charyszczak on 30/10/2021.
//

import Foundation
import SwiftyKit

class Strings: SwiftyKitStrings {
    // MARK: SearchBar
    override var searchBarCancel: String {
        return L10n.Localizable.SearchBar.cancel
    }

    override var searchBarPlaceholder: String {
        return L10n.Localizable.SearchBar.search
    }

    // MARK: PermissionView
    override var permissionViewNegativeButton: String {
        return L10n.Localizable.PermissionView.notNow
    }

    override var permissionViewPositiveButton: String {
        return L10n.Localizable.PermissionView.allow
    }

    override var permissionViewAppTrackingTitle: String {
        return L10n.Localizable.PermissionView.Title.appTracking
    }

    override var permissionViewAppTrackingDescription: String {
        return L10n.Localizable.PermissionView.Description.appTracking
    }

    override var permissionViewCameraTitle: String {
        return L10n.Localizable.PermissionView.Title.camera
    }

    override var permissionViewCameraDescription: String {
        return L10n.Localizable.PermissionView.Description.camera
    }

    override var permissionViewLocationTitle: String {
        return L10n.Localizable.PermissionView.Title.location
    }

    override var permissionViewLocationDescription: String {
        return L10n.Localizable.PermissionView.Description.location
    }

    override var permissionViewPushNotificationsTitle: String {
        return L10n.Localizable.PermissionView.Title.pushNotifications
    }

    override var permissionViewPushNotificationsDescription: String {
        return L10n.Localizable.PermissionView.Description.pushNotifications
    }
}

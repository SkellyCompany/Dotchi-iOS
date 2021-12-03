//
//  PortalResources.swift
//  Portal
//
//  Created by Greg Charyszczak on 30/10/2021.
//

import Foundation
import SwiftyKit

class Resources: SwiftyKitResources {
    private let _strings: StringsProtocol = Strings()
    private let _colors: ColorsProtocol = Colors()
    private let _icons: IconsProtocol = Icons()
    private let _animations: Animations = Animations()
    
    override var strings: StringsProtocol {
        return _strings
    }
    
    override var colors: ColorsProtocol {
        return _colors
    }
    
    override var icons: IconsProtocol {
        return _icons
    }
    
    override var animations: AnimationsProtocol {
        return _animations
    }
    
    public override init() { }
}

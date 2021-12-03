//
//  Animations.swift
//  Portal
//
//  Created by Greg Charyszczak on 03/11/2021.
//

import Foundation
import SwiftyKit
import Lottie

class Animations: SwiftyKitAnimations {
    override var loadingViewLoading: Animation? {
        return Lottie.loading
    }
    
    override var loadingViewError: Animation? {
        return Lottie.loadingError
    }
    
    override var loadingViewSuccess: Animation? {
        return Lottie.loadingSuccess
    }
}

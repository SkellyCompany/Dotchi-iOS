//
//  BrowseViewController.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

class DotchiViewController: UIViewController {
    let eventHandler: DotchiEventHandlerProtocol
    
    init(eventHandler: DotchiEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dotchi"
        self.view.backgroundColor = Asset.Colors.pastelBackground.color
    }
}

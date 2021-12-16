//
//  LogsViewController.swift
//  Dotchi
//
//  Created by 6rishka on 04/12/2021.
//

import Foundation
import UIKit

class LogsViewController: UIViewController {
    let eventHandler: LogsEventHandlerProtocol
    var model: LogsViewModel? {
        didSet {
            refresh()
        }
    }
    
    init(eventHandler: LogsEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Logs"
        self.view.backgroundColor = Asset.Colors.pastelBackground.color
    }
}

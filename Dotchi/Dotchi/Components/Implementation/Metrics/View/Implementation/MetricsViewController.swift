//
//  MetricsViewControllere.swift
//  Dotchi
//
//  Created by 6rishka on 04/12/2021.
//

import Foundation
import UIKit

class MetricsViewController: UIViewController {
    let eventHandler: MetricsEventHandlerProtocol
    var model: MetricsViewModel? {
        didSet {
            refresh()
        }
    }
    
    init(eventHandler: MetricsEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Metrics"
        self.view.backgroundColor = Asset.Colors.pastelBackground.color
    }
}

extension MetricsViewController {
    func refresh() {
        
    }
}

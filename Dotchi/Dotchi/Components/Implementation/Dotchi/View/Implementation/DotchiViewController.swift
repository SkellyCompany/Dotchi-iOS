//
//  BrowseViewController.swift
//  Portal
//
//  Created by 6rishka on 02/12/2021.
//

import UIKit

class DotchiViewController: UIViewController {
    let eventHandler: DotchiEventHandlerProtocol
    var model: DotchiViewModel? {
        didSet {
            refresh()
        }
    }
    
    // MARK: Views
    private weak var scrollView: UIScrollView?
    private weak var contentView: UIView?
    
    private weak var healthView: UIView?
    
    init(eventHandler: DotchiEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
    }
}

// MARK: Initialization
extension DotchiViewController {
    private func initialize() {
        initializeView()
        initializeScrollView()
        initializeHealthView()
    }
    
    private func initializeView() {
        self.title = "Dotchi"
        self.view.backgroundColor = Asset.Colors.pastelBackground.color
    }
    
    private func initializeScrollView() {
        let scrollView = UIScrollView()
        let contentView = UIView()
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
        }
        contentView.snp.makeConstraints { make in
            make.top.bottom.centerX.width.equalToSuperview()
        }
        
        self.scrollView = scrollView
        self.contentView = contentView
    }
    
    private func initializeHealthView() {
        let healthView = StatisticView()
        healthView.update(header: "Health")
        contentView?.addSubview(healthView)
        healthView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

// MARK: Refreshing
extension DotchiViewController {
    private func refresh() {
        
    }
    
    private func refreshStatisticViews() {
        
    }
}

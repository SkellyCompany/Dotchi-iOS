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
    private weak var healthView: StatisticView?
    private weak var happinessView: StatisticView?
    
    // MARK: UI Constants
    private let contentMargin = 10
    
    init(eventHandler: DotchiEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        refresh()
    }
}

// MARK: Initialization
extension DotchiViewController {
    private func initialize() {
        initializeView()
        initializeScrollView()
        initializeHealthView()
        initializeHappinessView()
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
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(contentMargin)
            make.bottom.equalToSuperview().offset(-contentMargin)
            make.width.equalToSuperview().offset(-contentMargin*2)
        }
        
        self.scrollView = scrollView
        self.contentView = contentView
    }
    
    private func initializeHealthView() {
        let healthView = StatisticView()
        healthView.update(header: "Health")
        contentView?.addSubview(healthView)
        healthView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
        
        self.healthView = healthView
    }
    
    private func initializeHappinessView() {
        guard let healthView = healthView else { return }
        let happinessView = StatisticView()
        happinessView.update(header: "Happiness")
        contentView?.addSubview(happinessView)
        happinessView.snp.makeConstraints { make in
            make.top.equalTo(healthView.snp.bottom).offset(contentMargin)
            make.bottom.left.right.equalToSuperview()
        }
        
        self.happinessView = happinessView
    }
}

// MARK: Refreshing
extension DotchiViewController {
    private func refresh() {
        refreshStatisticViews()
    }
    
    private func refreshStatisticViews() {
        guard let statistics = model?.statistics,
              let healthView = healthView,
              let happinessView = happinessView else { return }
        healthView.update(value: statistics.health)
        happinessView.update(value: statistics.happiness)
    }
}

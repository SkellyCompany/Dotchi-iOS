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
    
    // MARK: UI Constants
    private let collectionViewHorizontalInset: CGFloat = 25
    private let collectionViewVerticalInset: CGFloat = 10
    private let cellHeight: CGFloat = 50
    private let cellMargin: CGFloat = 2
    
    // MARK: UI Objects
    private var dataSource: UICollectionViewDiffableDataSource<LogsCollectionView.Section, Log>?
    
    init(eventHandler: LogsEventHandlerProtocol) {
        self.eventHandler = eventHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

// MARK: Initialization
extension LogsViewController {
    func initialize() {
        self.title = "Logs"
        self.view.backgroundColor = Asset.Colors.pastelBackground.color
    }
}

// MARK: Refreshing
extension LogsViewController {
    func refresh() {
        refreshCollectionView()
    }
    
    private func refreshCollectionView() {
        guard let logs = model?.logs else { return }
        var snapshot = NSDiffableDataSourceSnapshot<LogsCollectionView.Section, Log>()
        snapshot.appendSections(LogsCollectionView.Section.allCases)
        snapshot.appendItems(logs)
        snapshot.reloadItems(logs)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: Collection View - Compositional Layout
extension LogsViewController {
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout() { sectionNumber, env in
            guard let section = LogsCollectionView.Section(rawValue: sectionNumber) else {
                fatalError("Incorrect setup of LogsCollectionView")
            }
            return self.createCollectionSectionLayout(for: section)
        }
    }

    private func createCollectionSectionLayout(for section: LogsCollectionView.Section) -> NSCollectionLayoutSection {
        switch section {
        case .main:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(cellHeight))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: NSCollectionLayoutSpacing.fixed(cellMargin), trailing: nil, bottom: NSCollectionLayoutSpacing.fixed(cellMargin))
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(cellHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: collectionViewVerticalInset, leading: collectionViewHorizontalInset, bottom: collectionViewHorizontalInset, trailing: collectionViewHorizontalInset)
            return section
        }
    }
}

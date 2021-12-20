//
//  LogsViewController.swift
//  Dotchi
//
//  Created by 6rishka on 04/12/2021.
//

import Foundation
import UIKit
import SwiftyKit

class LogsViewController: UIViewController {
    let eventHandler: LogsEventHandlerProtocol
    var model: LogsViewModel? {
        didSet {
            refresh()
        }
    }
    
    // MARK: Views
    private weak var collectionView: UICollectionView?
    
    // MARK: UI Constants
    private let collectionViewHorizontalInset: CGFloat = 15
    private let collectionViewVerticalInset: CGFloat = 10
    private let cellHeight: CGFloat = 50
    private let cellMargin: CGFloat = 15
    
    // MARK: UI Objects
    private let searchController = SearchController()
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
        refresh()
    }
}

// MARK: Initialization
extension LogsViewController {
    private func initialize() {
        initializeView()
        initializeSearchController()
        initializeCollectionView()
    }
    
    private func initializeView() {
        self.title = "Logs"
        self.view.backgroundColor = .systemBackground
    }
    
    private func initializeSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = true
        navigationItem.searchController = searchController
    }
    
    private func initializeCollectionView() {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCompositionalLayout())
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        collectionView.register(LogCell.self, forCellWithReuseIdentifier: LogCell.identifier)
        dataSource = UICollectionViewDiffableDataSource<LogsCollectionView.Section, Log>(collectionView: collectionView) { (collectionView, indexPath, log) -> UICollectionViewCell in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LogCell.identifier, for: indexPath) as! LogCell
            cell.setup(for: log)
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<LogsCollectionView.Section, Log>()
        snapshot.appendSections(LogsCollectionView.Section.allCases)
        snapshot.appendItems(model?.logs ?? [])
        dataSource?.apply(snapshot, animatingDifferences: true)
        
        self.collectionView = collectionView
    }
}

// MARK: Refreshing
extension LogsViewController {
    private func refresh() {
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
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(cellHeight))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: NSCollectionLayoutSpacing.fixed(cellMargin), trailing: nil, bottom: NSCollectionLayoutSpacing.fixed(cellMargin))
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(cellHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: collectionViewVerticalInset, leading: collectionViewHorizontalInset, bottom: collectionViewHorizontalInset, trailing: collectionViewHorizontalInset)
            return section
        }
    }
}

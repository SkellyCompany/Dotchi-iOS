import UIKit

class LogCell: UICollectionViewCell {
    static let identifier = "LogCell"
    
    // MARK: Views
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.backgroundColor = .red
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .blue
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: UI Constants
    private let contentMargin = 10
    private let nameHeight = 30
    private let nameDescriptionMargin = 10
    
    // MARK: Lifecycle methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
}

// MARK: Initialization
extension LogCell {
    func initialize() {
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(nameHeight)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(nameDescriptionMargin)
        }
    }
}

// MARK: Setup
extension LogCell {
    func setup(for log: Log) {
        nameLabel.text = log.name
        descriptionLabel.text = log.description
    }
}

// MARK: Resetting
extension LogCell {
    func reset() {
        nameLabel.text = ""
        descriptionLabel.text = ""
    }
}

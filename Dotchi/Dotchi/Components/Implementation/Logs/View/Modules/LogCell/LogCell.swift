import UIKit

class LogCell: UICollectionViewCell {
    static let identifier = "LogCell"
    
    // MARK: Views
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "doc.fill")
        imageView.setImageColor(to: .systemBlue)
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
//        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: UI Constants
    private let cornerRadius: CGFloat = 15
    private let contentMargin = 15
    private let imageNameMargin = 5
    private let headerHeight = 20
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
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = cornerRadius
        
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(contentMargin)
            make.height.width.equalTo(headerHeight)
        }
        
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-contentMargin)
            make.top.equalToSuperview().offset(contentMargin)
            make.height.equalTo(headerHeight)
            make.left.equalTo(imageView.snp.right).offset(imageNameMargin)
        }
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().offset(-contentMargin)
            make.left.equalToSuperview().offset(contentMargin)
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

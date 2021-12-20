import UIKit

class MetricView: UIView {
    // MARK: Views
    private lazy var headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: UI Constants
    private let cornerRadius: CGFloat = 15
    private let contentMargin = 15
    private let headerImageLabelMargin = 5
    private let headerHeight = 15
    private let valueHeight = 30
    
    // MARK: Lifecycle methods
    init() {
        super.init(frame: CGRect.zero)
        initialize()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Initialization
extension MetricView {
    private func initialize() {
        initializeView()
        initializeHeaderImageView()
        initializeHeaderLabel()
        initializeValueLabel()
    }
    
    private func initializeView() {
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = cornerRadius
    }
    
    private func initializeHeaderImageView() {
        addSubview(headerImageView)
        headerImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(contentMargin)
            make.height.width.equalTo(headerHeight)
        }
    }
    
    private func initializeHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-contentMargin)
            make.top.equalToSuperview().offset(contentMargin)
            make.left.equalTo(headerImageView.snp.right).offset(headerImageLabelMargin)
            make.height.equalTo(headerHeight)
        }
    }
    
    private func initializeValueLabel() {
        addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(contentMargin)
            make.right.bottom.equalToSuperview().offset(-contentMargin)
            make.left.equalToSuperview().offset(contentMargin)
            make.height.equalTo(valueHeight)
        }
    }
}

// MARK: Updating
extension MetricView {
    func update(tint: UIColor) {
        headerLabel.textColor = tint
        headerImageView.setImageColor(to: tint)
    }
    
    func update(headerImage: UIImage) {
        headerImageView.image = headerImage
    }
    
    func update(headerString: String) {
        headerLabel.text = headerString
    }
    
    func update(value: String) {
        valueLabel.text = value
    }
}



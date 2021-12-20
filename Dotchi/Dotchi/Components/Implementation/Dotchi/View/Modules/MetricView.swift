import UIKit

class MetricView: UIView {
    // MARK: Views
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
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
    private let contentMargin = 10
    private let headerHeight = 30
    private let valueHeight = 50
    
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
        initializeHeaderLabel()
        initializeValueLabel()
    }
    
    private func initializeView() {
        self.backgroundColor = Asset.Colors.pastelBackgroundElement.color
        self.layer.cornerRadius = cornerRadius
    }
    
    private func initializeHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-contentMargin)
            make.top.left.equalToSuperview().offset(contentMargin)
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
    func update(header: String) {
        headerLabel.text = header
    }
    
    func update(value: Double) {
        valueLabel.text = "\(value)"
    }
}



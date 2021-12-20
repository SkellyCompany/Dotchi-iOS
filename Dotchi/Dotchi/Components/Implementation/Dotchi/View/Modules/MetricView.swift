import UIKit

class MetricView: UIView {
    // MARK: Views
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: UI Constants
    private let headerHeight = 30
    
    // MARK: Lifecycle methods
    init() {
        super.init(frame: CGRect.zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Initialization
extension MetricView {
    private func initialize() {
        initializeHeaderLabel()
    }
    
    private func initializeHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
            make.height.equalTo(headerHeight)
        }
    }
}

// MARK: Updating
extension MetricView {
    func update(header: String) {
        headerLabel.text = header
    }
    
    func update(value: Double) {
        
    }
}



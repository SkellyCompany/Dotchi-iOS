import UIKit
import SwiftyKit

class StatisticView: UIView {
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

    private lazy var valueContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var valueContainerFill: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.layer.cornerRadius = 10
        return view
    }()

    private lazy var valueLabel: OutlinedLabel = {
        let label = OutlinedLabel()
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.outlineColor = .systemGray6
        label.outlineWidth = 4
        return label
    }()

    // MARK: UI Constants
    private let cornerRadius: CGFloat = 15
    private let contentMargin = 15
    private let headerImageLabelMargin = 5
    private let headerHeight = 15
    private let valueHeight = 40

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
extension StatisticView {
    private func initialize() {
        initializeView()
        initializeHeaderImageView()
        initializeHeaderLabel()
        initializeValueContainer()
        initializeValueContainerFill()
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

    private func initializeValueContainer() {
        addSubview(valueContainer)
        valueContainer.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(contentMargin)
            make.right.bottom.equalToSuperview().offset(-contentMargin)
            make.left.equalToSuperview().offset(contentMargin)
            make.height.equalTo(valueHeight)
        }
    }

    private func initializeValueContainerFill() {
        valueContainer.addSubview(valueContainerFill)
        valueContainerFill.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0)
        }
    }

    private func initializeValueLabel() {
        valueContainer.addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

// MARK: Updating
extension StatisticView {
    func update(tint: UIColor) {
        headerLabel.textColor = tint
        headerImageView.setImageColor(to: tint)
        valueContainerFill.backgroundColor = tint
    }

    func update(headerImage: UIImage) {
        headerImageView.image = headerImage
    }

    func update(headerString: String) {
        headerLabel.text = headerString
    }

    func update(value: Double, valueAsString: String) {
        valueLabel.text = valueAsString
        let anim = UIViewPropertyAnimator(duration: 0.2,
                                          curve: UIView.AnimationCurve.linear,
                                          animations: { [weak self] in
                                            self?.valueContainerFill.snp.remakeConstraints { make in
                                                make.top.left.bottom.equalToSuperview()
                                                make.width.equalToSuperview().multipliedBy(value / 100)
                                            }
                                            self?.layoutIfNeeded()
                                          })
        anim.startAnimation()
    }
}

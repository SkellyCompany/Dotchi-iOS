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
    
    private weak var statisticsLabel: UILabel?
    private weak var healthView: StatisticView?
    private weak var happinessView: StatisticView?
    
    private weak var metricsLabel: UILabel?
    private weak var temperatureView: MetricView?
    private weak var humidityView: MetricView?
    private weak var lightIntensityView: MetricView?
    private weak var soundIntensityView: MetricView?
    
    // MARK: UI Constants
    private let contentHorizontalMargin = 15
    private let contentVerticalMargin = 10
    
    private let statisticsInnerMargin = 10
    private let statitsticsMetricsMargin = 25
    private let metricsInnerMargin = 10
    
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
        
        initializeStatisticsLabel()
        initializeHealthView()
        initializeHappinessView()
        
        initializeMetricsLabel()
        initializeTemperatureView()
        initializeHumidityView()
        initializeLightIntensityView()
        initializeSoundIntensityView()
    }
    
    private func initializeView() {
        self.title = "Dotchi"
        self.view.backgroundColor = .systemBackground
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
            make.top.equalToSuperview().offset(contentVerticalMargin)
            make.bottom.equalToSuperview().offset(-contentVerticalMargin)
            make.width.equalToSuperview().offset(-contentHorizontalMargin*2)
        }
        
        self.scrollView = scrollView
        self.contentView = contentView
    }
    
    private func initializeStatisticsLabel() {
        let statisticsLabel = UILabel()
        statisticsLabel.textAlignment = .left
        statisticsLabel.numberOfLines = 1
        statisticsLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        statisticsLabel.translatesAutoresizingMaskIntoConstraints = false
        statisticsLabel.text = "Statistics"
        
        contentView?.addSubview(statisticsLabel)
        statisticsLabel.snp.makeConstraints() { make in
            make.top.left.right.equalToSuperview()
        }
        
        self.statisticsLabel = statisticsLabel
    }
    
    private func initializeHealthView() {
        guard let statisticsLabel = statisticsLabel else { return }
        let healthView = StatisticView()
        healthView.update(headerString: "Health")
        healthView.update(headerImage: UIImage(systemName: "heart.fill")!)
        healthView.update(tint: .systemRed)
        contentView?.addSubview(healthView)
        healthView.snp.makeConstraints { make in
            make.top.equalTo(statisticsLabel.snp.bottom).offset(statisticsInnerMargin)
            make.left.right.equalToSuperview()
        }
        
        self.healthView = healthView
    }
    
    private func initializeHappinessView() {
        guard let healthView = healthView else { return }
        let happinessView = StatisticView()
        happinessView.update(headerString: "Happiness")
        happinessView.update(headerImage: UIImage(systemName: "star.fill")!)
        happinessView.update(tint: .systemYellow)
        contentView?.addSubview(happinessView)
        happinessView.snp.makeConstraints { make in
            make.top.equalTo(healthView.snp.bottom).offset(statisticsInnerMargin)
            make.left.right.equalToSuperview()
        }
        
        self.happinessView = happinessView
    }
    
    private func initializeMetricsLabel() {
        guard let happinessView = happinessView else { return }
        let metricsLabel = UILabel()
        metricsLabel.textAlignment = .left
        metricsLabel.numberOfLines = 1
        metricsLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        metricsLabel.translatesAutoresizingMaskIntoConstraints = false
        metricsLabel.text = "Metrics"
        
        contentView?.addSubview(metricsLabel)
        metricsLabel.snp.makeConstraints() { make in
            make.top.equalTo(happinessView.snp.bottom).offset(statitsticsMetricsMargin)
            make.left.right.equalToSuperview()
        }
        
        self.metricsLabel = metricsLabel
    }
    
    private func initializeTemperatureView() {
        guard let metricsLabel = metricsLabel else { return }
        let temperatureView = MetricView()
        temperatureView.update(headerString: "Temperature")
        temperatureView.update(headerImage: UIImage(systemName: "thermometer")!)
        temperatureView.update(tint: .systemBlue)
        contentView?.addSubview(temperatureView)
        temperatureView.snp.makeConstraints { make in
            make.top.equalTo(metricsLabel.snp.bottom).offset(statisticsInnerMargin)
            make.left.equalToSuperview()
        }
        
        self.temperatureView = temperatureView
    }
    
    private func initializeHumidityView() {
        guard let metricsLabel = metricsLabel,
              let temperatureView = temperatureView else { return }
        let humidityView = MetricView()
        humidityView.update(headerString: "Humidity")
        humidityView.update(headerImage: UIImage(systemName: "drop.fill")!)
        humidityView.update(tint: .systemBlue)
        contentView?.addSubview(humidityView)
        humidityView.snp.makeConstraints { make in
            make.top.equalTo(metricsLabel.snp.bottom).offset(metricsInnerMargin)
            make.right.equalToSuperview()
            make.left.equalTo(temperatureView.snp.right).offset(metricsInnerMargin)
            make.width.equalTo(temperatureView.snp.width)
        }
        
        self.humidityView = humidityView
    }
    
    private func initializeLightIntensityView() {
        guard let temperatureView = temperatureView else { return }
        let lightIntensityView = MetricView()
        lightIntensityView.update(headerString: "Light")
        lightIntensityView.update(headerImage: UIImage(systemName: "lightbulb.fill")!)
        lightIntensityView.update(tint: .systemBlue)
        contentView?.addSubview(lightIntensityView)
        lightIntensityView.snp.makeConstraints { make in
            make.top.equalTo(temperatureView.snp.bottom).offset(metricsInnerMargin)
            make.left.equalToSuperview()
        }
        
        self.lightIntensityView = lightIntensityView
    }
    
    private func initializeSoundIntensityView() {
        guard let humidityView = humidityView,
              let lightIntensityView = lightIntensityView else { return }
        let soundIntensityView = MetricView()
        soundIntensityView.update(headerString: "Sound")
        soundIntensityView.update(headerImage: UIImage(systemName: "speaker.wave.2.fill")!)
        soundIntensityView.update(tint: .systemBlue)
        contentView?.addSubview(soundIntensityView)
        soundIntensityView.snp.makeConstraints { make in
            make.top.equalTo(humidityView.snp.bottom).offset(metricsInnerMargin)
            make.right.equalToSuperview()
            make.left.equalTo(lightIntensityView.snp.right).offset(metricsInnerMargin)
            make.width.equalTo(lightIntensityView.snp.width)
        }
        
        self.soundIntensityView = soundIntensityView
    }
}

// MARK: Refreshing
extension DotchiViewController {
    private func refresh() {
        refreshStatisticsViews()
        refreshMetricsViews()
    }
    
    private func refreshStatisticsViews() {
        guard let statistics = model?.statistics,
              let healthView = healthView,
              let happinessView = happinessView else { return }
        healthView.update(value: statistics.health, valueAsString: statistics.healthString)
        happinessView.update(value: statistics.happiness, valueAsString: statistics.happinessString)
    }
    
    private func refreshMetricsViews() {
        guard let metrics = model?.metrics,
              let temperatureView = temperatureView,
              let humidityView = humidityView,
              let lightIntensityView = lightIntensityView,
              let soundIntensityView = soundIntensityView  else { return }
        temperatureView.update(value: metrics.temperatureString)
        humidityView.update(value: metrics.humidityString)
        lightIntensityView.update(value: metrics.lightIntensityString)
        soundIntensityView.update(value: metrics.soundIntensityString)
    }
}

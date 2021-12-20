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
    
    private weak var temperatureView: MetricView?
    private weak var humidityView: MetricView?
    private weak var lightIntensityView: MetricView?
    private weak var soundIntensityView: MetricView?
    
    // MARK: UI Constants
    private let contentHorizontalMargin = 15
    private let contentVerticalMargin = 10
    
    private let statisticsInnerMargin = 10
    private let statitsticsMetricsMargin = 10
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
        
        initializeHealthView()
        initializeHappinessView()
        
        initializeTemperatureView()
        initializeHumidityView()
        initializeLightIntensityView()
        initializeSoundIntensityView()
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
            make.top.equalToSuperview().offset(contentVerticalMargin)
            make.bottom.equalToSuperview().offset(-contentVerticalMargin)
            make.width.equalToSuperview().offset(-contentHorizontalMargin*2)
        }
        
        self.scrollView = scrollView
        self.contentView = contentView
    }
    
    private func initializeHealthView() {
        let healthView = StatisticView()
        healthView.update(header: "Health")
        contentView?.addSubview(healthView)
        healthView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(statisticsInnerMargin)
            make.left.right.equalToSuperview()
        }
        
        self.healthView = healthView
    }
    
    private func initializeHappinessView() {
        guard let healthView = healthView else { return }
        let happinessView = StatisticView()
        happinessView.update(header: "Happiness")
        contentView?.addSubview(happinessView)
        happinessView.snp.makeConstraints { make in
            make.top.equalTo(healthView.snp.bottom).offset(statisticsInnerMargin)
            make.left.right.equalToSuperview()
        }
        
        self.happinessView = happinessView
    }
    
    private func initializeTemperatureView() {
        guard let happinessView = happinessView else { return }
        let temperatureView = MetricView()
        temperatureView.update(header: "Temperature")
        contentView?.addSubview(temperatureView)
        temperatureView.snp.makeConstraints { make in
            make.top.equalTo(happinessView.snp.bottom).offset(statitsticsMetricsMargin)
            make.left.equalToSuperview()
        }
        
        self.temperatureView = temperatureView
    }
    
    private func initializeHumidityView() {
        guard let happinessView = happinessView,
              let temperatureView = temperatureView else { return }
        let humidityView = MetricView()
        humidityView.update(header: "Humidity")
        contentView?.addSubview(humidityView)
        humidityView.snp.makeConstraints { make in
            make.top.equalTo(happinessView.snp.bottom).offset(statitsticsMetricsMargin)
            make.right.equalToSuperview()
            make.left.equalTo(temperatureView.snp.right).offset(metricsInnerMargin)
            make.width.equalTo(temperatureView.snp.width)
        }
        
        self.humidityView = humidityView
    }
    
    private func initializeLightIntensityView() {
        guard let temperatureView = temperatureView else { return }
        let lightIntensityView = MetricView()
        lightIntensityView.update(header: "Light Intensity")
        contentView?.addSubview(lightIntensityView)
        lightIntensityView.snp.makeConstraints { make in
            make.top.equalTo(temperatureView.snp.bottom).offset(statitsticsMetricsMargin)
            make.left.equalToSuperview()
        }
        
        self.lightIntensityView = lightIntensityView
    }
    
    private func initializeSoundIntensityView() {
        guard let humidityView = humidityView,
              let lightIntensityView = lightIntensityView else { return }
        let soundIntensityView = MetricView()
        soundIntensityView.update(header: "Sound Intensity")
        contentView?.addSubview(soundIntensityView)
        soundIntensityView.snp.makeConstraints { make in
            make.top.equalTo(humidityView.snp.bottom).offset(statitsticsMetricsMargin)
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
        healthView.update(value: statistics.health)
        happinessView.update(value: statistics.happiness)
    }
    
    private func refreshMetricsViews() {
        guard let metrics = model?.metrics,
              let temperatureView = temperatureView,
              let humidityView = humidityView,
              let lightIntensityView = lightIntensityView,
              let soundIntensityView = soundIntensityView  else { return }
        temperatureView.update(value: metrics.temperature)
        humidityView.update(value: metrics.humidity)
        lightIntensityView.update(value: metrics.lightIntensity)
        soundIntensityView.update(value: metrics.soundIntensity)
    }
}

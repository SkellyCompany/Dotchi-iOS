import Foundation

struct DotchiMetrics {
    let temperature: Double
    let humidity: Double
    let lightIntensity: Double
    let soundIntensity: Double
    
    var temperatureString: String {
        return "\(String(format: "%.0f", temperature))°C"
    }
    
    var humidityString: String {
        return "\(String(format: "%.0f", humidity))%"
    }
    
    var lightIntensityString: String {
        return "\(String(format: "%.0f", lightIntensity))%"
    }
    
    var soundIntensityString: String {
        return "\(String(format: "%.0f", soundIntensity))%"
    }
}

extension DotchiMetrics {
    init(from dto: DotchiMetricsDTO) {
        self.temperature = dto.temperature
        self.humidity = dto.humidity
        self.lightIntensity = dto.lightIntensity
        self.soundIntensity = dto.soundIntensity
    }
}

import Foundation

struct DotchiMetrics {
    let temperature: Double
    let humidity: Double
    let lightIntensity: Double
    let soundIntensity: Double
}

extension DotchiMetrics {
    init(from dto: DotchiMetricsDTO) {
        self.temperature = dto.temperature
        self.humidity = dto.humidity
        self.lightIntensity = dto.lightIntensity
        self.soundIntensity = dto.soundIntensity
    }
}

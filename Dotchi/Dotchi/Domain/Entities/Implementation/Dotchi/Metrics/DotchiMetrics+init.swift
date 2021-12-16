import Foundation

extension DotchiMetrics {
    init(from dto: DotchiMetricsDTO) {
        self.temperature = dto.temperature
        self.humidity = dto.humidity
        self.lightIntensity = dto.lightIntensity
        self.soundIntensity = dto.soundIntensity
    }
}

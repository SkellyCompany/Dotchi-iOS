import Foundation

struct DotchiStatistics {
    let health: Double
    let happiness: Double

    var healthString: String {
        return "\(String(format: "%.0f", health))%"
    }

    var happinessString: String {
        return "\(String(format: "%.0f", happiness))%"
    }
}

extension DotchiStatistics {
    init(from dto: DotchiStatisticsDTO) {
        self.happiness = dto.happiness
        self.health = dto.health
    }
}

import Foundation

struct DotchiStatistics {
    let health: Double
    let happiness: Double
}

extension DotchiStatistics {
    init(from dto: DotchiStatisticsDTO) {
        self.happiness = dto.happiness
        self.health = dto.health
    }
}

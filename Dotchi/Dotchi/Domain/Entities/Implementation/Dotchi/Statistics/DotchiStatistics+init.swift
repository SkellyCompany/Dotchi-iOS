import Foundation

extension DotchiStatistics {
    init(from dto: DotchiStatisticsDTO) {
        self.happiness = dto.happiness
        self.health = dto.health
    }
}

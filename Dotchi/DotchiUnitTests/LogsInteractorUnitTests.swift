import XCTest
import Mockingbird

class LogsInteractorUnitTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_filterByKeyword_withEmptyKeyword_shouldReturnPassedArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "logDescription1", timestamp: Date.now)
        ]
        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act

        // Assert
    }
}

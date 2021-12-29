import XCTest
import Mockingbird

class LogsInteractorUnitTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test1_filterByKeyword_withEmptyKeyword_shouldReturnPassedArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now)
        ]
        let keyword = ""

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual(logs, result)
    }

    func test2_filterByKeyword_withOneLogWhichNameMatches_shouldReturnPassedArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now)
        ]
        let keyword = "log1"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual(logs, result)
    }

    func test3_filterByKeyword_withOneLogWhichDoesNotMatch_shouldReturnEmptyArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now)
        ]
        let keyword = "bird"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual([], result)
    }

    func test4_filterByKeyword_withEmptyArray_shouldReturnEmptyArray() throws {
        // Arrange
        let logs: [Log] = []
        let keyword = "bird"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual([], result)
    }

    func test5_filterByKeyword_withOneLogWhichDescriptionMatches_shouldReturnEmptyArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now)
        ]
        let keyword = "description"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual(logs, result)
    }

    func test6_filterByKeyword_withManyLogsWhichNameMatches_shouldReturnPassedArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now),
            Log(id: "2", name: "log2", description: "description2", timestamp: Date.now),
            Log(id: "3", name: "log3", description: "description3", timestamp: Date.now),
            Log(id: "4", name: "log4", description: "description4", timestamp: Date.now)
        ]
        let keyword = "log"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual(logs, result)
    }

    func test7_filterByKeyword_withOneLogWhichOnlyNameMatches_shouldReturnPassedArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now)
        ]
        let keyword = "log"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual(logs, result)
    }

    func test8_filterByKeyword_withOneLogWhichOnlyDescriptionMatches_shouldReturnPassedArray() throws {
        // Arrange
        let logs = [
            Log(id: "1", name: "log1", description: "description1", timestamp: Date.now)
        ]
        let keyword = "description"

        let logRepository: LogRepositoryProtocol = mock(LogRepositoryProtocol.self)
        let logsInteractor: LogsInteractor = LogsInteractor(repository: logRepository)

        // Act
        let result = logsInteractor.filter(logs: logs, keyword: keyword)

        // Assert
        XCTAssertEqual(logs, result)
    }
}

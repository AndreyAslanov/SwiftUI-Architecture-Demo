import Foundation

protocol NetworkClientProtocol {
    func fetchArticles() async throws -> [Article]
}

final class MockNetworkClient: NetworkClientProtocol {
    func fetchArticles() async throws -> [Article] {
        try await Task.sleep(nanoseconds: 400_000_000) // 0.4s имитация сети
        
        let mockJSON = """
        [
          {
            "id": "\(UUID().uuidString)",
            "title": "Swift Concurrency in Practice",
            "subtitle": "Structured concurrency with async/await",
            "body": "In this demo we explore how to use async/await in a clean architecture setup..."
          },
          {
            "id": "\(UUID().uuidString)",
            "title": "Designing Modular iOS Apps",
            "subtitle": "Why feature modules matter",
            "body": "Splitting your app into feature modules improves testability, onboarding and build times..."
          }
        ]
        """

        let data = Data(mockJSON.utf8)
        return try JSONDecoder().decode([Article].self, from: data)
    }
}

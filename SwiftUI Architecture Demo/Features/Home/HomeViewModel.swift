import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }

    func load() {
        Task {
            await loadArticles()
        }
    }

    private func loadArticles() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await networkClient.fetchArticles()
            self.articles = result
        } catch {
            self.errorMessage = "Failed to load articles: \(error.localizedDescription)"
        }

        isLoading = false
    }
}

import Foundation

final class AppContainer: ObservableObject {
    let networkClient: NetworkClientProtocol

    init(networkClient: NetworkClientProtocol = MockNetworkClient()) {
        self.networkClient = networkClient
    }
}

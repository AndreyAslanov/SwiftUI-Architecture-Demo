import SwiftUI

@main
struct SwiftUIArchitectureDemoApp: App {
    @StateObject private var container = AppContainer()

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView()
                .environmentObject(container)
        }
    }
}

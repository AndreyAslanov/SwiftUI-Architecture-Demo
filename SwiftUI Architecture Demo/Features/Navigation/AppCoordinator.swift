import SwiftUI

struct AppCoordinatorView: View {
    @EnvironmentObject private var container: AppContainer
    @State private var selectedArticle: Article?

    var body: some View {
        NavigationStack {
            HomeView(
                viewModel: HomeViewModel(networkClient: container.networkClient),
                onSelectArticle: { article in
                    selectedArticle = article
                }
            )
            .navigationDestination(item: $selectedArticle) { article in
                ArticleDetailsView(article: article)
            }
        }
    }
}

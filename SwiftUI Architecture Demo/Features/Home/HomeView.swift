import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    let onSelectArticle: (Article) -> Void

    init(viewModel: HomeViewModel, onSelectArticle: @escaping (Article) -> Void) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.onSelectArticle = onSelectArticle
    }

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Articles")
        }
        .onAppear {
            if viewModel.articles.isEmpty {
                viewModel.load()
            }
        }
    }

    @ViewBuilder
    private var content: some View {
        if viewModel.isLoading {
            ProgressView("Loading...")
        } else if let error = viewModel.errorMessage {
            VStack(spacing: 12) {
                Text(error)
                    .foregroundColor(.red)
                Button("Retry") {
                    viewModel.load()
                }
            }
        } else if viewModel.articles.isEmpty {
            Text("No articles yet")
                .foregroundColor(.secondary)
        } else {
            List(viewModel.articles) { article in
                Button {
                    onSelectArticle(article)
                } label: {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(article.title)
                            .font(.headline)
                        Text(article.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
        }
    }
}

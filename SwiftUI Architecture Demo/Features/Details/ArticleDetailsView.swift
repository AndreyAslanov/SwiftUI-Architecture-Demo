import SwiftUI

struct ArticleDetailsView: View {
    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(article.subtitle)
                    .font(.headline)
                    .foregroundColor(.secondary)

                Divider()

                Text(article.body)
                    .font(.body)
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

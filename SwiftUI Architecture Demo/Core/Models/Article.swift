import Foundation

struct Article: Identifiable, Decodable, Hashable {
    let id: UUID
    let title: String
    let subtitle: String
    let body: String
}

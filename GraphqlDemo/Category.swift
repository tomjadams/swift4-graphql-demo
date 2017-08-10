import Foundation

// https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

struct GraphQlResponse : Codable {
    let data: Category
}

struct Category : Codable {
    let name: String
}

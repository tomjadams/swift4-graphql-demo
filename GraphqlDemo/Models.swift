import Foundation

// https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

struct GraphQlResponse : Codable {
    let data: Data
}

struct Data : Codable {
    let categories: [Category]
}

struct Category : Codable {
    let name: String
}

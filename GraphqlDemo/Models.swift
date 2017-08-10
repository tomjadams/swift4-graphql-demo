import Foundation

// Details: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

struct GraphQlResponse : Codable {
    let data: DataContainer
}

struct DataContainer : Codable {
    let categories: [Category]
}

struct Category : Codable {
    let name: String
    let products: [Product]
}

struct Product : Codable {
    let name: String
    
    enum CodingKeys : String, CodingKey {
        case name = "displayName"
    }
}

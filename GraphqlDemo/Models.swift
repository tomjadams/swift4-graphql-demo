import Foundation

// Details: https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types

struct GraphQlResponse : Codable {
    let dataField: DataContainer
    
    enum CodingKeys : String, CodingKey {
        case dataField = "data"
    }
}

struct DataContainer : Codable {
    let categories: [Category]
}

struct Category : Codable {
    let name: String
}

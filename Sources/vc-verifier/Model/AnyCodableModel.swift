import Foundation

struct AnyCodable: Decodable {
    var value: Any
    
    init(_ value: Any) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let int = try? container.decode(Int.self) {
            value = int
        } else if let double = try? container.decode(Double.self) {
            value = double
        } else if let string = try? container.decode(String.self) {
            value = string
        } else if let bool = try? container.decode(Bool.self) {
            value = bool
        } else if let nestedDict = try? container.decode([String: AnyCodable].self) {
            value = nestedDict.mapValues { $0.value }
        } else if let nestedArray = try? container.decode([AnyCodable].self) {
            value = nestedArray.map { $0.value }
        } else if container.decodeNil() {
            value = Optional<Any>.none as Any
        } else {
            throw DownloadFailedError.invalidCredential
        }
    }
    
    subscript(key: String) -> Any? {
        if let dictionary = value as? [String: Any] {
            return dictionary[key]
        }
        return nil
    }
    
    subscript(index: Int) -> Any? {
        if let array = value as? [Any] {
            return array[index]
        }
        return nil
    }
    
    func dictionaryValue() -> [String: Any]? {
        return value as? [String: Any]
    }
    
    func arrayValue() -> [Any]? {
        return value as? [Any]
    }
}

import Foundation

struct RsaVerificationKey2018: Codable {
    let type: String
    let context: URL
    let publicKeyPem: String
    let id: URL
    let controller: URL
    
    enum CodingKeys: String, CodingKey {
        case type
        case context = "@context"
        case publicKeyPem
        case id
        case controller
    }
}

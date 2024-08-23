import Foundation

extension String {
    func preProcessVerifiableCredential() throws -> [String: Any] {
        let vc = self
        
        guard let data = vc.data(using: .utf8) else {
            throw DownloadFailedError.invalidCredential
        }
        
        var credential: [String: Any] = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:]
        
        guard let proof = credential["proof"] as? [String: Any] else {
            throw DownloadFailedError.noProof
        }
        
        if let proofType = proof["type"] as? String, proofType.isEmpty {
            throw DownloadFailedError.noProof
        }
        
        if let types = credential["type"] as? [String], !types.contains("VerifiableCredential") {
            throw DownloadFailedError.noProof
        }
        
        credential["type"] = ["VerifiableCredential"]
        
        print(credential.keys)
        return credential
    }
}

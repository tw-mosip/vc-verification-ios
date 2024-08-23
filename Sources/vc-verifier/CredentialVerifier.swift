import Foundation
import SwiftyRSA
import JOSESwift
import Security

public class CredentialVerifier{
    let traceabilityId: String
    
    public init(traceabilityId: String){
        self.traceabilityId = traceabilityId
    }
    
    private func decodeCredential(credential: String) throws -> [String: Any]? {
        guard let jsonData = credential.data(using: .utf8) else {
            throw CredentialVerificationError.invalidCredentialData
        }
        let decodedCredential = try JSONDecoder().decode(AnyCodable.self, from: jsonData)
        return decodedCredential.value as? [String: Any]
    }
    
    public func verifyCredential(credential: String) -> Bool{
        
        let logTag = Util.getLogTag(className: String(describing: type(of: self)), traceabilityId: traceabilityId)
        print(logTag, "Received Credentials Verification - Start.");
        
        do{
            try PS256VC.preProcessVerifiableCredential()
            
            guard let decodedCredential = try decodeCredential(credential: PS256VC),
                  let proof = decodedCredential["proof"] as? [String: Any],
                  let jws = proof["jws"] as? String,
                  let verificationMethod = proof["verificationMethod"] as? String else {
                print("Invalid credential format")
                return false
            }
            
            let (header, signature) = try decodeJws(jws)
            print(header)
            print(signature)
            
            guard let verificationMethod = proof["verificationMethod"] as? String else {
                print("No jws")
                return false
            }
            getPublicKey(verificationMethod) { publicKey in
                if let publicKey = publicKey {
                    print("Public Key: \(publicKey)")
                    do {
                        let s = self.formatPublicKeyString(publicKey)
                        
                        let publicKeyyy = try PublicKey(pemEncoded: s)
                        print("formatted key ", publicKeyyy)
                    } catch {
                        print("Error formatting public key: \(error)")
                    }
                } else {
                    print("Failed to retrieve public key")
                }
            }

        }
        catch(let error){
            print("error ", error)
        }
        return true
    }
    
    
    private func getPublicKey(_ url: String, completion: @escaping (String?) -> Void) {
        if let apiUrl = URL(string: url) {
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: apiUrl) { (data, response, error) in
                
                if let error = error {
                    print("Error: \(error)")
                    completion(nil)
                    return
                }
                
                guard let responseData = data else {
                    print("No data received")
                    completion(nil)
                    return
                }
                
                do {
                    let json = try JSONDecoder().decode(RsaVerificationKey2018.self, from: responseData)
                    completion(json.publicKeyPem)
                } catch {
                    print("Error parsing JSON: \(error)")
                    completion(nil)
                }
            }
            
            dataTask.resume()
        } else {
            print("URL is not valid!")
            completion(nil)
        }
    }
    
    
    func formatPublicKeyString(_ pemString: String) -> String {
        return pemString
            .replacingOccurrences(of: "-----BEGIN PUBLIC KEY-----", with: "")
            .replacingOccurrences(of: "-----END PUBLIC KEY-----", with: "")
            .replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\r", with: "")
    }
    
    private func createSecKey(fromPEM pemString: String) -> SecKey? {
        guard let publicKeyData = Data(base64Encoded: pemString) else {
            print("Invalid Base64 public key string")
            return nil
        }
        
        let keyDict: [String: Any] = [
            kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
            kSecAttrKeyClass as String: kSecAttrKeyClassPublic,
            kSecAttrKeySizeInBits as String: 2048
        ]
        
        var error: Unmanaged<CFError>?
        guard let secKey = SecKeyCreateWithData(publicKeyData as CFData, keyDict as CFDictionary, &error) else {
            print("Failed to create SecKey: \(error!.takeRetainedValue() as Error)")
            return nil
        }
        return secKey
    }
}

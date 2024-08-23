import Foundation
import JOSESwift

func decodeJws(_ jws: String) throws -> (JWSHeader, Data){
    do{
        let jws = try JWS(compactSerialization: jws)
        let header = jws.header
        let signature = jws.signature
        return (header, signature)
    }
    catch{
        print("error" )
        throw DownloadFailedError.invalidCredential
    }
}

import Foundation

class Util {
    private static var traceabilityId: String?
    
    static func getLogTag(className: String, traceabilityId: String? = nil) -> String {
        if let traceId = traceabilityId {
            self.traceabilityId = traceId
        }
        return "VC-Verifer : \(className) | traceID \(self.traceabilityId ?? "")"
    }
}


func base64UrlDecode(_ base64Url: String) -> Data? {
    var base64 = base64Url
        .replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")
    
    let neededLength = (4 - base64.count % 4) % 4
    base64.append(String(repeating: "=", count: neededLength))
    
    return Data(base64Encoded: base64)
}

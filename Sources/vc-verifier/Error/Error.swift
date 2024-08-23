import Foundation

public enum CredentialVerificationError: Error {
    case invalidCredentialData
    case invalidCredentialFormat
}

public enum DownloadFailedError: Error {
    case invalidCredential
    case noProof
}

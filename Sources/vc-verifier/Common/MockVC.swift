import Foundation

let PS256VC = 
"""
{
  "@context": [
    "https://www.w3.org/2018/credentials/v1",
    "https://api.qa-inji.mosip.net/.well-known/mosip-ida-context.json",
    {
      "sec": "https://w3id.org/security#"
    }
  ],
  "credentialSubject": {
    "face": "is8Qt4f/9k=",
    "gender": [
      {
        "language": "eng",
        "value": "Male"
      }
    ],
    "phone": "9876785789",
    "city": [
      {
        "language": "eng",
        "value": "Kenitra"
      }
    ],
    "fullName": [
      {
        "language": "eng",
        "value": "kumar"
      }
    ],
    "addressLine1": [
      {
        "language": "eng",
        "value": "saravangar"
      }
    ],
    "dateOfBirth": "1999/01/01",
    "id": "did:jwk:eyJrdHkiOiJSU0EiLCJlIjoiQVFBQiIsInVzZSI6InNpZyIsImFsZyI6IlJTMjU2IiwibiI6InBQZTNzOXRCRUstak15dFN6emN3SDAxUHFhTmU0WXQxQ1ByNkxULU9oVVgyQjVJbm5TWERFT294ZC1GalFYRHRJN0VKcW9YdF9DalZaOXJQQ0gxX2R3dzljSVdCWUh4S0R3cEQzQmhLTUhVWTdGdDk3ZTVaYlJkcjlyME5kVmlPRzFXbGxoZ0Q0ZTFWYWJsbDJTNzZ5QjQ1STZ6V05rM0paSzBoX3E2NmxMM2FFVUREbFFJbDFBQVBySHEzaGVzTjZjY2x2R1FoSmEwams2a3ZZQ1BpWXp3N1N3em4wcldMVmg3MDJ6U2ZOSWtXUl9KX0dMd2VhNTNfemJCVzRVdU8tbjVJbGNLdk56RGRSQ21YWGZIOExXWjlmd3BJeGttX0Q0X01aazFfV3hwbmdJUGd0MWYyLXRMU3h5dzJWV25BZnFsS3IyY2M2LS1GMXFLaEx3UGpFdyJ9",
    "UIN": "3974189657",
    "email": "Aswin@gmail.com"
  },
  "id": "https://api.qa-inji.mosip.net/credentials/a45bffe3-ecdf-46c1-b059-0288f3dfe2fa",
  "issuanceDate": "2024-07-22T07:49:22.219Z",
  "issuer": "https://api.qa-inji.mosip.net/.well-known/ida-controller.json",
  "proof": {
    "created": "2024-07-22T07:49:22Z",
    "jws": "eyJiNjQiOmZhbHNlLCJjcml0IjpbImI2NCJdLCJraWQiOiJRVmRMTW9uWmNqM0doTUxjbmhuZEdmT0J2RVdHZHg0LU5qazRKRGNxb19NIiwiYWxnIjoiUFMyNTYifQ..lhM2BzYapSIWNI8oHhYKx4na7lOEO-TSzJOndP0PowTGbT1op2AOWdxnozidPckdBIFAPaIAbS4pmVj-jW-QeqiWqERbcHSNePLc-5ykz0VA-q6rFNJs-PJVldZlQMl1Ww_nNpRbTwTirGum3f0tp7MhXcqV_66tQQrFr81odP-rAntPdg-BUpsZ0tXbWUxczmmWshRIw5a67ZrslxVXx0umtE_rx3lVIStSXhUXdbwGOkZPNwAj4AdFTlSbYlRrrazWg1sAqzfT1EE8Kdj7D16TlEyKy011srtMqu2n-sRJBg69mZlcsqlDF6_sIspILMZnKueQvxZqeBOMRmQtpw",
    "proofPurpose": "assertionMethod",
    "type": "RsaSignature2018",
    "verificationMethod": "https://api.qa-inji.mosip.net/.well-known/ida-public-key.json"
  },
  "type": [
    "VerifiableCredential",
    "MOSIPVerifiableCredential"
  ]
}
"""

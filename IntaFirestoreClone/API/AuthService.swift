import UIKit
import Firebase


struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
    let userName: String
    let profileImage: UIImage
}


struct AuthService {
    static func registerUser(withCredential credentials: AuthCredentials) {
        debugPrint("credentials are: \(credentials)")
    }
}

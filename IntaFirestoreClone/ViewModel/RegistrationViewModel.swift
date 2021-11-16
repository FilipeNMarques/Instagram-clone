import UIKit


struct RegistrationViewModel: AuthenticationViewModelProtocol {
    
    var email: String?
    var password: String?
    var fullName: String?
    var userName: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false && userName?.isEmpty == false
    }
    
    
    var buttonBackgroundColor: UIColor {
        return formIsValid ? .systemPurple : .systemPurple.withAlphaComponent(0.4)
    }
    
    var buttonTitleColor: UIColor {
        return formIsValid ? .white : .white.withAlphaComponent(0.67)
    }
    
}
    
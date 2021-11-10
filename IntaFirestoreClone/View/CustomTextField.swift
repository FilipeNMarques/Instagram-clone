import UIKit


class CustomTextField: UITextField {
    
    init(placeholder: String, isPassword: Bool = false, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        let spacer = UIView()
        NSLayoutConstraint.activate([
            spacer.heightAnchor.constraint(equalToConstant: 50),
            spacer.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        leftView = spacer
        leftViewMode = .always
        
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .none
        textColor = .white
        keyboardAppearance = .dark
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        setHeight(45)
        self.keyboardType  = keyboardType
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        isSecureTextEntry = isPassword == true ? true : false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

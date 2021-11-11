import UIKit

class CustomAuthButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)

        translatesAutoresizingMaskIntoConstraints = false
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemPurple
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        setHeight(45)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

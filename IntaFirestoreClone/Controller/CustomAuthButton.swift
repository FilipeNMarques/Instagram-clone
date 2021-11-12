import UIKit

public func  makeCustomAuthButton(title: String, titleColor: UIColor = .white.withAlphaComponent(0.67), backgroundColor: UIColor = .systemPurple.withAlphaComponent(0.4)) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setHeight(45)
    button.setTitle(title, for: .normal)
    button.setTitleColor(titleColor, for: .normal)
    button.backgroundColor = backgroundColor
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    
    return button
    }


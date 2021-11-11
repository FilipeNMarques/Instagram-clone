import UIKit

public func  makeCustomAuthButton(title: String) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setHeight(45)
    button.setTitle(title, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .systemPurple
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    
    return button
    }


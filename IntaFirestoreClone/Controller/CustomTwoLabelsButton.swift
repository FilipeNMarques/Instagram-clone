import UIKit

public func makeTwoLabelsButton(normalText: String, boldText: String, fontSize: CGFloat = 16) -> UIButton {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.attributedTitle(normalText: normalText, boldText: boldText, fontSize: fontSize)
    
    
    return button
}

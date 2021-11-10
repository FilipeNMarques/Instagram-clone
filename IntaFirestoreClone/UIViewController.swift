import UIKit

extension UIViewController {
    func makeGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }
    
}

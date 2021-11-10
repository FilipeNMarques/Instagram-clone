import UIKit


extension UIButton {
    func attributedTitle(normalText: String, boldText: String, fontSize: CGFloat = 16) {
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.systemFont(ofSize: fontSize)]
        let attributedTitle = NSMutableAttributedString(string: "\(normalText) ", attributes: atts)

        let boldAtts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.87), .font: UIFont.boldSystemFont(ofSize: fontSize)]
        attributedTitle.append(NSAttributedString(string: boldText, attributes: boldAtts))

        setAttributedTitle(attributedTitle, for: .normal)
    }
}

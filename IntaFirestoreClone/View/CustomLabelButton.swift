import UIKit

class CustomTwoLabelButton: UIButton {
    
    init(normalText: String, boldText: String, fontSize: CGFloat = 16) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        attributedTitle(normalText: normalText, boldText: boldText, fontSize: fontSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

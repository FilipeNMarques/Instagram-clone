
import UIKit

class FeedCell: UICollectionViewCell {

//    MARK: - Properties
    
    lazy var profileImage = makeProfileImage()
    lazy var usernameButton = makeUsernameButton(title: "Venom")
    
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    
    func configureUI() {
        addSubview(profileImage)
        addSubview(usernameButton)
    }
    
    func configureConstraints() {
        profileImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImage.setDimensions(height: 40, width: 40)
        profileImage.layer.cornerRadius = 40 / 2
        
        usernameButton.centerY(inView: profileImage, leftAnchor: profileImage.rightAnchor, paddingLeft: 8)
    }
    
//    MARK: - Actions
    @objc func didTapUsername() {
        debugPrint("Did tap username button")
    }
    
//    MARK: - Makers
    
    private func makeProfileImage() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.image = UIImage(named: "venom-7")
        
        return image
    }
    
    private func makeUsernameButton(title: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle(title, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        
        return btn
    }
}


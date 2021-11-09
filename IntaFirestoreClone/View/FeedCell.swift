
import UIKit

class FeedCell: UICollectionViewCell {

//    MARK: - Properties
    
    lazy var profileImage = makeImageView(imageName: "venom-7")
    lazy var postImageView = makeImageView(imageName: "venom-7")
    lazy var actionButtonsStackView = makeStackView()
    lazy var usernameButton = makeUsernameButton(title: "Venom")
    lazy var likeButton = makeActionButton(imageName: "like_unselected")
    lazy var commentButton = makeActionButton(imageName: "comment")
    lazy var shareButton = makeActionButton(imageName: "send2")
    lazy var likesLabel = makePostLabels(labelText: "2 likes", fontTypeAndSize: UIFont.boldSystemFont(ofSize: 13))
    lazy var captionLabel = makePostLabels(labelText: "Some text about this photo", fontTypeAndSize: UIFont.systemFont(ofSize: 14))
    lazy var postTimeLabel = makePostLabels(labelText: "2 days ago", fontColor: .lightGray)
    
    
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
        addSubview(postImageView)
        addSubview(actionButtonsStackView)
        addSubview(likesLabel)
        addSubview(captionLabel)
        addSubview(postTimeLabel)
        
    }
    
    func configureConstraints() {
        profileImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImage.setDimensions(height: 40, width: 40)
        profileImage.layer.cornerRadius = 40 / 2
        
        usernameButton.centerY(inView: profileImage, leftAnchor: profileImage.rightAnchor, paddingLeft: 8)
        
        postImageView.anchor(top: profileImage.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        
        actionButtonsStackView.anchor(top: postImageView.bottomAnchor, width: 120, height: 50)
        
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
        NSLayoutConstraint.activate([
            postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1)
        ])
    }
    
//    MARK: - Actions
    @objc func didTapUsername() {
        debugPrint("Did tap username button")
    }
    
//    MARK: - Makers
    
    private func makeImageView(imageName: String) -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.image = UIImage(named: imageName)
        
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
    
    private func makeActionButton(imageName: String) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.tintColor = .black
        
        return btn
    }
    
    private func makePostLabels(labelText: String, fontTypeAndSize: UIFont = UIFont.systemFont(ofSize: 12), fontColor: UIColor = .darkGray) -> UILabel {
        let label = UILabel()
        label.text = labelText
        label.font = fontTypeAndSize
        label.textColor = fontColor
        
        return label
    }
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }
}


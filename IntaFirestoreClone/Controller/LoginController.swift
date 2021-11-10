import UIKit

class LoginController: UIViewController {


    //    MARK: - Properties

    lazy var instaLogo = makeImageView()
    lazy var emailTextField = CustomTextField(placeholder: "Your e-mail", keyboardType: .emailAddress)
    lazy var passwordTextField = CustomTextField(placeholder: "Your password", isPassword: true, keyboardType: .default)
    lazy var loginButton = makeLoginButton()
    lazy var inputStackView = makeInputStackView()
    lazy var dontHaveAccountButton = makeLabelButton()
    lazy var forgetPasswordButton = makeLabelButton(normaltext: "Forget your password?", boldtext: "Get help signing in", fontSize: 13)

    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationController()
        setupUI()
        setupConstraints()
    }

    //    MARK: - SetupUI
    private func setupUI() {
        makeGradient()
        view.addSubview(instaLogo)
        view.addSubview(inputStackView)
        view.addSubview(dontHaveAccountButton)
        
    }

    //    MARK: - Setup constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            instaLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            instaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instaLogo.heightAnchor.constraint(equalToConstant: 80),
            instaLogo.widthAnchor.constraint(equalToConstant: 120),
            
            inputStackView.topAnchor.constraint(equalTo: instaLogo.bottomAnchor, constant: 32),
            inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -32),
            
            dontHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }

    //    MARK: - Helpers
    
    func setupNavigationController() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .black
    
    }

    //    MARK: - Makers

    private func makeInputStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, forgetPasswordButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        return stackView
    }

    private func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Instagram_logo_white")
        
        return image
    }

    private func makeGradient() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = view.frame
        view.layer.addSublayer(gradient)
    }

    private func makeLoginButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setHeight(45)
        
        return button
    }

    private func makeLabelButton(normaltext: String = "Don't have an account? ", boldtext: String = "Sign Up", fontSize: CGFloat = 16) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        let atts: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.systemFont(ofSize: fontSize)]
        let attributedTitle = NSMutableAttributedString(string: "\(normaltext)  ", attributes: atts)
        
        let boldAtts : [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.7), .font: UIFont.boldSystemFont(ofSize: fontSize)]
        attributedTitle.append(NSAttributedString(string: boldtext, attributes: boldAtts))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }

}

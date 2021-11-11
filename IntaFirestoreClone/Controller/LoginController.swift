import UIKit

class LoginController: UIViewController {


    //    MARK: - Properties

    lazy var instaLogo = makeImageView()
    lazy var emailTextField = CustomTextField(placeholder: "Your e-mail", keyboardType: .emailAddress)
    lazy var passwordTextField = CustomTextField(placeholder: "Your password", isPassword: true, keyboardType: .default)
    lazy var loginButton = makeLoginButton()
    lazy var inputStackView = makeInputStackView()
    lazy var dontHaveAccountButton = makeDonthaveAccountLabelButton()
    lazy var forgetPasswordButton = makeForgetPasswordLabelButton()
    
    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        setupUI()
        setupConstraints()
    }
    
    //    MARK: - Actions
    
    @objc func handleShowSingUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleLoginButton() {
         debugPrint("Hello")
     }
    
    @objc func handleForgetPassword() {
        debugPrint("Forget password button pressed")
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
    
    func configNavigationController() {
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
     
    private func makeLoginButton() -> CustomAuthButton {
        let button = CustomAuthButton(title: "Login In")
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        return button
    }
    
    private func makeDonthaveAccountLabelButton() -> CustomTwoLabelButton {
        let button = CustomTwoLabelButton(normalText: "Don't have an account? ", boldText: "Sign Up", fontSize: 13)
        button.addTarget(self, action: #selector(handleShowSingUp), for: .touchUpInside)
        
        return button
    }
    
    private func makeForgetPasswordLabelButton() -> CustomTwoLabelButton {
        let button = CustomTwoLabelButton(normalText: "Forget your password?", boldText: "Get help signing in", fontSize: 13)
        button.addTarget(self, action: #selector(handleForgetPassword), for: .touchUpInside)
        
        return button
    }
    
}

import UIKit


class RegistrationController: UIViewController {
    
    //    MARK: - Properties
    
    lazy var userAvatarButton = makePhotoButton()
    lazy var emailTextField = CustomTextField(placeholder: "Your e-mail", keyboardType: .emailAddress)
    lazy var passwordTextField = CustomTextField(placeholder: "Your password", isPassword: true)
    lazy var fullNameTextField = CustomTextField(placeholder: "Your full name")
    lazy var usernameTextField = CustomTextField(placeholder: "Your username")
    lazy var signUpButton = makeCustomAuthButton(title: "Login In")
    lazy var stackView = makeStackView()
    lazy var alreadyAccountButton = makeTwoLabelsButton(normalText: "Already have an account?", boldText: "Sign In", fontSize: 13)
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        setupButtonTargets()
        setupUI()
        setupConstraints()
    }
    
    //    MARK: - Targets
    func setupButtonTargets() {
        alreadyAccountButton.addTarget(self, action: #selector(handleAlreadyAccount), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
    }
    
    //    MARK: - Actions
    
   @objc func handleSignUpButton() {
        debugPrint("Sign up button touched")
    }
    
    @objc func handleAlreadyAccount() {
        navigationController?.popViewController(animated: true)
    }
    
    //    MARK: - SetupUI
    
    private func setupUI() {
        makeGradient()
        view.addSubview(userAvatarButton)
        view.addSubview(stackView)
        view.addSubview(alreadyAccountButton)
    }
    
    //    MARK: - Setup constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            userAvatarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userAvatarButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userAvatarButton.heightAnchor.constraint(equalToConstant: 90),
            userAvatarButton.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: userAvatarButton.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            alreadyAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alreadyAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //    MARK: - Helpers
    
    private func configNavigationController() {
        

    }
    
    //    MARK: - Makers
    
    private func makeStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullNameTextField, usernameTextField, signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        return stackView
    }
    
    private func makePhotoButton() -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "person.crop.circle.badge.plus"), for: .normal)
        button.imageView?.contentMode = .scaleToFill
        button.tintColor = .white
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }
    
}


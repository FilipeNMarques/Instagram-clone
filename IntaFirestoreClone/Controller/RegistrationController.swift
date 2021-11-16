import UIKit


class RegistrationController: UIViewController {
    
    //    MARK: - Properties
    
    private var viewModel = RegistrationViewModel()
    private var profileImage: UIImage?
    
    lazy var userAvatarButton = makePhotoButton()
    lazy var emailTextField = CustomTextField(placeholder: "Your e-mail", keyboardType: .emailAddress)
    lazy var passwordTextField = CustomTextField(placeholder: "Your password", isPassword: true)
    lazy var fullNameTextField = CustomTextField(placeholder: "Your full name")
    lazy var usernameTextField = CustomTextField(placeholder: "Your username")
    lazy var signUpButton = makeCustomAuthButton(title: "Sign Up")
    lazy var stackView = makeStackView()
    lazy var alreadyAccountButton = makeTwoLabelsButton(normalText: "Already have an account?", boldText: "Sign In", fontSize: 13)
    
    //    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationController()
        configNotificationObservers()
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
        
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        guard let profileImage = self.profileImage else { return }
        
        let credentials = AuthCredentials(email: email, password: password, fullName: fullName, userName: username, profileImage: profileImage)
        
        AuthService.registerUser(withCredential: credentials)
    }
    
    @objc func handleAlreadyAccount() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func textDidChange(sender: UITextField) {
        switch sender {
            
        case emailTextField:
            viewModel.email = sender.text
        case passwordTextField:
            viewModel.password = sender.text
        case fullNameTextField:
            viewModel.fullName = sender.text
        case usernameTextField:
            viewModel.userName = sender.text
        default:
            debugPrint("Unexpected textfield")
        }
        
        updateForm()
    }
    
    @objc func handleProfilePhotoSelec() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
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
            userAvatarButton.heightAnchor.constraint(equalToConstant: 120),
            userAvatarButton.widthAnchor.constraint(equalToConstant: 120),
            
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
    
    private func configNotificationObservers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
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
        button.addTarget(self, action: #selector(handleProfilePhotoSelec), for: .touchUpInside)
        return button
    }
    
}

// MARK: - FormViewModel

extension RegistrationController: FormViewModelProtocol {
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signUpButton.isEnabled = viewModel.formIsValid
    }
}

// MARK: - UIImagePickerControllerDelegate

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        profileImage = selectedImage
        
        userAvatarButton.layer.cornerRadius = userAvatarButton.frame.width / 2
        userAvatarButton.layer.masksToBounds = true
        userAvatarButton.layer.borderColor = UIColor.white.cgColor
        userAvatarButton.layer.borderWidth = 2
        
        userAvatarButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}

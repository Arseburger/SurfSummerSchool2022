//
//  AuthorizationViewController.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 20.08.2022.
//

import UIKit

final class AuthorizationViewController: UIViewController {

    // MARK: Views -
    
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    // MARK: Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupAppearence()
    }
    
    // MARK: Actions -
    
    @IBAction private func signInButtonPressed(_ sender: Any) {
    }
    
    
    // MARK: Setup -
}
extension AuthorizationViewController {
    
    func setupAppearence() {
        [loginTextField, passwordTextField].forEach { textField in
            textField?.backgroundColor = Colors.AuthorizationTextField.background
            textField?.borderStyle = .none
            textField?.attributedPlaceholder = NSMutableAttributedString(
                string: "\(textField?.placeholder ?? "")",
                attributes:
                    [
                        .font : Fonts.SFProText.regular?.withSize(16.0),
                        .strokeColor : Colors.secondaryLabel
                    ]
            )
            textField?.clearsOnInsertion = true
            textField?.rightViewMode = .whileEditing
        }
    }
    
    func setupNavigationBar() {
        navigationController?.setupAppearence()
        navigationItem.title = "Вход"
    }
}

//
//  AuthorizationTextField.swift
//  SurfSummerSchool2022
//
//  Created by Александр Королёв on 20.08.2022.
//

import Foundation
import UIKit

final class AuthorizationTextField: UIView, UITextFieldDelegate {
    private var bottomBorder = UIView()
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAppearence()
        addBorder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAppearence()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAppearence() {
        Bundle.main.loadNibNamed("AuthorizationTextField", owner: self, options: nil)
        translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .none
        backView.backgroundColor = Colors.AuthorizationTextField.background
        textField.backgroundColor = .clear
        errorLabel.textColor = Colors.AuthorizationTextField.error
    }
    
    public func showError() {
        errorLabel.isHidden = false
    }
    
    private func addBorder() {
        let frame = CGRect(
            origin: CGPoint(
                x: textField.bounds.minX,
                y: textField.bounds.maxY
            ),
            size: CGSize(
                width: textField.bounds.width,
                height: 1.0
            )
        )
        bottomBorder = UIView(frame: frame)
        bottomBorder.backgroundColor = Colors.AuthorizationTextField.border
        textField.addSubview(bottomBorder)
    }
}

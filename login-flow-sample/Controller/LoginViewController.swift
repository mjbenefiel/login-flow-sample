//
//  LoginViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/25/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    weak var delegate: OnboardingDelegate?
    
    private let isSuccessfulLogin = true
    
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private enum PageType{
        case login
        case signUp
    }
    
   private var currentPageType: PageType = .login{
        didSet{
            setupViewsFor(pageType: currentPageType)
            print (currentPageType)
        }
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupViewsFor(pageType: .login)
    }
    
    private func setupViewsFor(pageType: PageType){
        errorLabel.text = ""
        passwordConfirmationTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    
    @IBAction func forgetPasswordButtonTapped (_ sender: Any){
        
    }
    
    
    @IBAction func signUpButtonTap(_ sender: Any) {
    }
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        if isSuccessfulLogin{
            delegate?.showMainTabBarController()
        } else {
            print("hey")
        }
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        //print(sender.selectedSegmentIndex)
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
    }
}

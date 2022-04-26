//
//  LoginViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/25/22.
//

import Foundation
import UIKit
import MBProgressHUD
import FirebaseAuth

class LoginViewController: UIViewController {
    
    weak var delegate: OnboardingDelegate?
    
    //private let isSuccessfulLogin = true
    
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
    
    private var errorMessage: String? {
        didSet{
            showErrorMessageIfNeeded(text: errorMessage)
        }
    }
    
    private var currentPageType: PageType = .login{
        didSet{
            setupViewsFor(pageType: currentPageType)
            print (currentPageType)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupViewsFor(pageType: .login)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setupViewsFor(pageType: .login)
        emailTextField.becomeFirstResponder()
    }
    
    private func setupViewsFor(pageType: PageType){
        errorMessage = nil
        passwordConfirmationTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    
    private func showErrorMessageIfNeeded(text: String?){
        errorLabel.isHidden = text == nil
        errorLabel.text = text
        
    }
    
    @IBAction func forgetPasswordButtonTapped (_ sender: Any){
        
    }
    
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let passwordConfirmation = passwordConfirmationTextField.text, !passwordConfirmation.isEmpty else{
            showErrorMessageIfNeeded(text: "Invalid form")
            return
        }
        
        guard password == passwordConfirmation else{
            showErrorMessageIfNeeded(text: "Passwords are incorrect")
            return
        }
        
        print("email: \(email), \(password)")
        MBProgressHUD.showAdded(to: view, animated: true)
        
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let error = error {
                self.showErrorMessageIfNeeded(text: error.localizedDescription)
                print(error.localizedDescription)
            } else if let userId = result?.user.uid{
                
                self.delegate?.showMainTabBarController()
                
                print ("userId created: \(userId)")
            }
        }
    }
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        view.endEditing(true)
       
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showErrorMessageIfNeeded(text: "Invalid form")
            return
        }
        
        MBProgressHUD.showAdded(to: view, animated: true)
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            if let error = error {
                self.showErrorMessageIfNeeded(text: error.localizedDescription)
            } else if let _ = result?.user.uid {
                self.delegate?.showMainTabBarController()
                
            }
        }
        
    }
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        //print(sender.selectedSegmentIndex)
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
    }
}

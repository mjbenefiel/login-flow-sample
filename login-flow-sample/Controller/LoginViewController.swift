//
//  LoginViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/25/22.
//

import Foundation
import UIKit
import MBProgressHUD
import Loaf
import IterableSDK

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: OnboardingDelegate?
    private let authManager = AuthManager()
    
    //private let isSuccessfulLogin = true
    
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    //@IBOutlet var label: UILabel!
    // let userDefaults = UserDefaults(suiteName: "saved_data")
    
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
        userNameTextField.delegate = self
        setupViewsFor(pageType: .login)
        //        if let value = UDM.shared.defaults.value(forKey: "username") as? String {
        //           label.text = value
        //       }
    }
    
    
    
    @IBAction func textFieldShouldReturn(sender: UIButton) {
        //Save username
        UDM.shared.defaults.setValue(userNameTextField.text, forKey: "username")
        //print("username: \(userNameTextField.text)")
        return
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //setupViewsFor(pageType: .login)
        emailTextField.becomeFirstResponder()
        
    }
    
    private func setupViewsFor(pageType: PageType){
        errorMessage = nil
        passwordConfirmationTextField.isHidden = pageType == .login
        userNameTextField.isHidden = pageType == .login
        signUpButton.isHidden = pageType == .login
        forgetPasswordButton.isHidden = pageType == .signUp
        loginButton.isHidden = pageType == .signUp
    }
    
    private func showErrorMessageIfNeeded(text: String?){
        errorLabel.isHidden = text == nil
        errorLabel.text = text
        
    }
    
    @IBAction func forgetPasswordButtonTapped (_ sender: Any){
        
        let alertController = UIAlertController(title: "Forget Password", message: "Please enter your email address", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if let textField = alertController.textFields?.first,
               let email = textField.text, !email.isEmpty {
                self.authManager.resetPassword(withEmail: email) { (result) in
                    switch result {
                    case .success:
                        self.showAlert(title: "Password Reset Successful", message: "Please check your email to find reset link")
                        print("Success")
                    case .failure(let error):
                        Loaf(error.localizedDescription, state: .error, location: .top, sender: self).show()
                    }
                }
                print("process this email: \(email)")
            }
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil )
    }
    
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty,
              let userName = userNameTextField.text, !userName.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let passwordConfirmation = passwordConfirmationTextField.text, !passwordConfirmation.isEmpty else{
            showErrorMessageIfNeeded(text: "Invalid form")
            return
        }
        
        
        guard password == passwordConfirmation else{
            showErrorMessageIfNeeded(text: "Passwords are incorrect")
            return
        }
        
        //print("email: \(email), \(password)")
        MBProgressHUD.showAdded(to: view, animated: true)
        authManager.signUpNewUser(withEmail: email, password: password) { (result) in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch result {
            case .success:
                self.delegate?.showMainTabBarController()
                //print(user.email)
            case .failure(let error):
                self.showErrorMessageIfNeeded(text: error.localizedDescription)
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
        
        authManager.loginUser(withEmail: email, password: password) { (result) in
            MBProgressHUD.hide(for: self.view, animated: true)
            switch result {
            case .success:
                self.delegate?.showMainTabBarController()
            case .failure(let error):
                self.showErrorMessageIfNeeded(text: error.localizedDescription)
                
            }
        }
        
    }
    
    @IBAction func updatedUserProfile(_ sender: UIButton) {
        IterableAPI.email = "michaeljbenefiel+usertest3@gmail.com"
        let dataField: [String: Any] = [
            "firstName": "Michael",
            "isRegisteredUser": true,
            "SA_User_Test_Key": "completed"
        ]
        
        IterableAPI.updateUser(dataField,
                               mergeNestedObjects: false,
                               onSuccess: myUserUpdateSuccessHandler,
                               onFailure: myUserUpdateFailureHandler)
    }

    func myUserUpdateSuccessHandler(data: [AnyHashable: Any]?) -> () {
        print("Successfully sent user update request to Iterable")
    }

    func myUserUpdateFailureHandler(reason: String?, data: Data?) -> () {
        print("Failure sending user update request to Iterable")
    }


    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        //print(sender.selectedSegmentIndex)
        currentPageType = sender.selectedSegmentIndex == 0 ? .login : .signUp
    }
}

class UDM {
    static let shared = UDM()
    let defaults = UserDefaults(suiteName: "saved_data")!
    
}

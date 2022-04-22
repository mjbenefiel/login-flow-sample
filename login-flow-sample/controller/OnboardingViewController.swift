//
//  OnboardingViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/22/22.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupViews()
    }
//    private func setupViews(){
//        view.backgroundColor = .red
//    }
    
    @IBAction func getStartedButtonTapped(_sender: UIButton){
       // print("get started button tapped")
        performSegue(withIdentifier: K.Segue.showLoginSignUpScreen, sender: nil)
        
    }
}

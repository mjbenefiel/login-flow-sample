//
//  LoadingViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        delay(durationInSeconds: 2.0){
            self.showInitialView()
        }

    }
    
//    private func setupViews() {
//        view.backgroundColor = .orange
//    }
//
    private func showInitialView() {
        //if user is logged in, show main tab bar controller
        // if user is not logged in, show onboarding controller
        if isUserLoggedIn {
            
            PresenterManager.shared.show(vc: .mainTabBarController)
            
        } else{
            performSegue(withIdentifier: K.Segue.showOnboardingScreen, sender: nil)
        }
        
    }
}
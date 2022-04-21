//
//  LoadingViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import UIKit

class LoadingViewController: UIViewController {
    
    private let isUserLoggedIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.showInitialView()
        }
    }
    
    private func setupViews() {
        view.backgroundColor = .orange
    }
    
    private func showInitialView() {
        //if user is logged in, show main tab bar controller
        // if user is not logged in, show onboarding controller
        if isUserLoggedIn {
            
            let mainTabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController")
            if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
               let window = sceneDelegate.window {
                window.rootViewController = mainTabBarController
            }
            
        } else{
            performSegue(withIdentifier: "showOnboarding", sender: nil)
        }
        
    }
}

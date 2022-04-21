//
//  SettingsViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    private func setupViews(){
        view.backgroundColor = .gray
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem){
        //print("logout")
        
        let onboardingViewController = UIStoryboard(name: K.storyboardID.main, bundle: nil).instantiateViewController(withIdentifier: K.storyboardID.onboardingViewController)
        
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = onboardingViewController
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

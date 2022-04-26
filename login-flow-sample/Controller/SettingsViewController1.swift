//
//  SettingsViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import Foundation
import UIKit
import MBProgressHUD
import FirebaseAuth

class SettingsViewController1: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        self.title = K.NavigationTitle.settings
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem){
        
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) {
            
            do {
                try Auth.auth().signOut()
                MBProgressHUD.hide(for: self.view, animated: true)
                PresenterManager.shared.show(vc: .onboarding )
            } catch(let error) {
                print(error.localizedDescription)
                MBProgressHUD.hide(for: self.view, animated: true)
            }
            
        }
        
    }
}

//
//  SettingsViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import Foundation
import UIKit
import MBProgressHUD
import Loaf

class SettingsViewController1: UIViewController{
    
    private let authManager = AuthManager()
    
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
            
            let result = self.authManager.logoutUser()
            switch result {
            case .success:
                PresenterManager.shared.show(vc: .onboarding )
            case .failure(let error):
                Loaf(error.localizedDescription, state: .error, location: .top, sender: self).show()
            }
            MBProgressHUD.hide(for: self.view, animated: true)
            
        }
        
    }
}

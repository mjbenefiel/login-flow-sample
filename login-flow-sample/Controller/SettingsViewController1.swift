//
//  SettingsViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import Foundation
import UIKit
import MBProgressHUD

class SettingsViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem){
        MBProgressHUD.showAdded(to: view, animated: true)
        delay(durationInSeconds: 0.5) {
            MBProgressHUD.hide(for: self.view, animated: true)
            PresenterManager.shared.show(vc: .onboarding )
        }

    }
}

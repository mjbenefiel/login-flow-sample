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
       
    }

    
    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem){
        //print("logout")
        PresenterManager.shared.show(vc: .onboarding )
    }
}

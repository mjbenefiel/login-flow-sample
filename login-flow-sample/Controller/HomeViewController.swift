//
//  HomeViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/26/22.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.home
    }
    
    private func setupViews() {
        if let email = Auth.auth().currentUser?.email{
            emailLabel.text = "Welcome, \(email)"
        } else {
            emailLabel.text = "Something is wrong"
        }
    }
}

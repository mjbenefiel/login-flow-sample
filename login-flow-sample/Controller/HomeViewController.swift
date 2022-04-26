//
//  HomeViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/26/22.
//

import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.home
    }
}

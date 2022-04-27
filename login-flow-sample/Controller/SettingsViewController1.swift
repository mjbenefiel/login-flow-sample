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


private let reuseIdentifier = "SettingsCell"

class SettingsViewController1: UIViewController{
    
    private let authManager = AuthManager()

    
    // MARK: - Properties
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        configureUI()
        
    }
    
    // MARK: - Helper Functions
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationItem.title = "Settings"
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

extension SettingsViewController1: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        return cell
    }
    
    
}

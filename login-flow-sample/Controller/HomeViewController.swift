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
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        assignbackground()
    }
    
    func assignbackground(){
          let background = UIImage(named: "background")

          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }
    
    private func setupNavigationBar() {
        self.title = K.NavigationTitle.home
    }
    
    private func setupViews() {
//        if let email = Auth.auth().currentUser?.email{
//            emailLabel.text = "Welcome, \(email)"
//        } else {
//            emailLabel.text = "Something is wrong"
//        }
        
        if let value = UDM.shared.defaults.value(forKey: "username") as? String {
                userNameLabel.text =
            """
            \(value)
            """
                                            
            }
    }
}

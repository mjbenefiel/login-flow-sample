//
//  PresenterManager.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//
import Foundation
import UIKit

class PresenterManager {
    static let shared = PresenterManager()
    
    private init() {}
    
    enum VC {
        case mainTabBarController
        case onboarding
        
    }
    
    func show(vc: VC){
        var viewController: UIViewController
        switch vc{
        case .mainTabBarController:
            viewController = UIStoryboard(name: K.storyboardID.main, bundle: nil).instantiateViewController(withIdentifier: K.storyboardID.MainTabBarController)
        case .onboarding:
            viewController = UIStoryboard(name: K.storyboardID.main, bundle: nil).instantiateViewController(withIdentifier: K.storyboardID.onboardingViewController)
        }
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

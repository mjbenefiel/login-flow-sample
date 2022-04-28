//
//  SettingsSection.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/27/22.
//
//import UIKit
//import Loaf
//import FirebaseAuth


protocol SectionType: CustomStringConvertible {
    var containsSwitch: Bool { get }
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Social
    case Communications
    
    var description: String {
        switch self {
        case .Social: return "Social"
        case .Communications: return "Communications"
            
        }
    }
}

private let authManager = AuthManager()

enum AuthError:Error {
    case unknownError
}
enum SocialOptions: Int, CaseIterable, SectionType {
    case editProfile
    case logout
    
    var containsSwitch: Bool {
        return false
    }
    
    var description: String {
        switch self {
        case .editProfile: return "Edit Profile"
        case .logout: return "Password & Security"
        }
        
    }
}

enum CommunicationOptions: Int, CaseIterable, SectionType {
    case notifications
    case email
    case reportCrashes
    
    var containsSwitch: Bool {
        switch self {
        case .notifications: return true
        case .email: return true
        case .reportCrashes: return false
        }
    }
    
    var description: String {
        switch self {
        case .notifications: return "Notifications"
        case .email: return "Email"
        case .reportCrashes: return "Report Crashes"
        }
    }
    
}



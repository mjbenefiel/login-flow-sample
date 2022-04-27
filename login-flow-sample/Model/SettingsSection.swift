//
//  SettingsSection.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/27/22.
//

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

enum SocialOptions: Int, CaseIterable, CustomStringConvertible {
 case editProfile
 case logout
    
    var description: String {
        switch self {
        case .editProfile: return "Edit Profile"
        case .logout: return "Log Out"
            
        }
    }
}

enum CommunicationOptions: Int, CaseIterable, CustomStringConvertible {
    case notifications
    case email
    case reportCrashes
    
    var description: String {
        switch self {
        case .notifications: return "Notifications"
        case .email: return "Email"
        case .reportCrashes: return "Report Crashes"
        }
    }
    
}


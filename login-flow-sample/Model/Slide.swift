//
//  Slide.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/23/22.
//

import Foundation
import UIKit

struct Slide {
    let imageName: String
    let title: String
    let description: String
    
    static let collection: [Slide] = [
        Slide(imageName: "img1a", title: "Welcome to Iterable", description: "Lorem Ipsum Welcome"),
        Slide(imageName: "img2", title: "Connect Socially", description: "Lorem Ipsum Social"),
        Slide(imageName: "img3", title: "Safe and Secure", description: "Lorem Ipsum Safe"),
        
    ]
    
    
}

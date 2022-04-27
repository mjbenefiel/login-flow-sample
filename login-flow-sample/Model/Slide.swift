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
        Slide(imageName: "img7", title: "Mobile Playground", description: "Lorem Ipsum Welcome"),
        Slide(imageName: "img5", title: "Collaborate", description: "Lorem Ipsum Collaborate"),
        Slide(imageName: "img6", title: "Explore", description: "Lorem Ipsum Explore"),
        
    ]
    
    
}

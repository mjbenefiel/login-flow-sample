//
//  OnboardingCollectionViewCell.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/23/22.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    
    func configure(image: UIImage) {
        slideImageView.image = image
    }
    
}

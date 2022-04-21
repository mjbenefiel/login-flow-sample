//
//  Helper.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/21/22.
//

import Foundation

func delay(durationInSeconds seconds: Double, completion: @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
    
    }
    


//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Daniel Gilbert on 9/23/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subSpecies = ""
    
    func changeToAlphaMale() {
        isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact:String
        if isAlphaMale {
            randomFact = "Male lions are easy to recognize thanks to their distinctive manes. Males with darker manes are more likely to attract females."
        } else {
            randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }
        return randomFact
    }
}
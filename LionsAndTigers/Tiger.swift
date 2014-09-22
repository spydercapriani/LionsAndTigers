//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Daniel Gilbert on 9/19/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var name:String = ""
    var age:Int = 0
    var breed:String = ""
    var image:UIImage = UIImage(named:"")
    
    func randomFact() -> String {
        var randomNumber = Int(arc4random_uniform(3))
        
        switch randomNumber {
            case 0:
                return "The Tiger is the biggest species in the cat family"
            case 1:
                return "Tigers can reach a length of 3.3 meters"
            case 2:
                return "A group of tigers is known as an 'ambush' or 'streak'"
            default:
                return "Empty Fact"
        }
    }
}
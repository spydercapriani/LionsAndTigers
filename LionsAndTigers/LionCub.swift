//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Daniel Gilbert on 9/23/14.
//  Copyright (c) 2014 Daniel Gilbert. All rights reserved.
//

import Foundation

class LionCub:Lion {
    var isMale = false
    
    override func randomFact() -> String {
        var randomFact:String
        if isMale {
            randomFact = "Cubs are usually hidden in dense bush for approximately six weeks."
        }else {
            randomFact = "Cubs begin eating meat at about the age of six weeks."
        }
        return randomFact
    }
}
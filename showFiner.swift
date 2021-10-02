//
//  showFiner.swift
//  showFinder
//
//  Created by Alex Rahi on 10/19/20.
//

import Foundation
import UIKit

class showFinder {
    
    var name = ""
    
    var description = ""
    
    var platform = ""
    
    var rating = 0.0
    
    init() {
        name = ""
        
        description = ""
        
        platform = ""
        
        rating = 0.0
        
    }
    
    init (nam: String, desc: String, plat: String, rat: Double) {
        name = nam
        description = desc
        platform = plat
        rating = rat
    }
    
    
    
    
}

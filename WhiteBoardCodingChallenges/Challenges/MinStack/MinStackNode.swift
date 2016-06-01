//
//  MinStackNode.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class MinStackNode: NSObject {
    
    var value: Int
    var lowerNodeMinNode: MinStackNode?
    
    init(value: Int) {
        
        self.value = value
        
        super.init()
    }
    
}

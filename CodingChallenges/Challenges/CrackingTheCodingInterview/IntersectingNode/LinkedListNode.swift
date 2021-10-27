//
//  LinkedListNode.swift
//  CodingChallenges
//
//  Created by William Boles on 30/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class LinkedListNode: NSObject {

    var value: Int
    var next: LinkedListNode?
    
    init(value: Int) {
        
        self.value = value
        
        super.init()
    }
}

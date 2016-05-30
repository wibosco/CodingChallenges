//
//  Node.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 29/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

class Node: NSObject {

    // MARK: Properties
    
    var parent: Node?
    
    var left: Node?
    var right: Node?
    
    var value: Int
    
    // MARK: Init
    
    init(value: Int) {
        
        self.value = value
        
        super.init()
    }
    
    // MARK: Value
    
    func hasValueAsNodeChild(value: Int) -> Node? {
        
        if left?.value == value {
            
            return left
        }
        
        if right?.value == value {
            
            return right
        }
        
        return nil
    }
    
    // MARK: Nodes
    
    func addNodeAsChild(node: Node) {
        
        if left == nil {
            
            left = node
        }
        else {
            
            right = node
        }
        
        node.parent = self
    }
    
}

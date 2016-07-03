//
//  MinStack.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 3.2
class MinStack: NSObject {

    // MARK: Properties
    
    var nodes: [MinStackNode] = {
       
        return [MinStackNode]()
    }()
    
    // MARK: Actions
    
    func push(value: Int) {
        
        let node = MinStackNode.init(value: value)
        
        if let peek = peek() {
            
            if peek.lowerNodeMinNode!.value > node.value {
                
                node.lowerNodeMinNode = node
            }
            else {
                
                node.lowerNodeMinNode = peek.lowerNodeMinNode
            }
            
        }
        else {
            
            node.lowerNodeMinNode = node
        }
        
        nodes.insert(node, atIndex: 0)
    }
    
    func pop() -> MinStackNode? {
        
        if nodes.count > 0 {
            
            let head = nodes.removeFirst()
            
            return head
        }
        
        return nil
    }
    
    func peek() -> MinStackNode? {
        
        if nodes.count > 0 {
            
            return nodes[0]
        }
        
        return nil
    }
    
    func min() -> MinStackNode? {
        
        if let peek = peek() {
            
            return peek.lowerNodeMinNode
        }
        
        return nil
    }
}

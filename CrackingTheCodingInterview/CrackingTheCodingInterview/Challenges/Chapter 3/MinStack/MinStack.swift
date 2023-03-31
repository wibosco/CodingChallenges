//
//  MinStack.swift
//  CrackingTheCodingInterview
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 3.2
final class MinStack {
    var nodes = [MinStackNode]()
    
    // MARK: Actions
    
    func push(value: Int) {
        let node = MinStackNode(value: value)
        
        if let peek = peek() {
            if peek.lowerNodeMinNode!.value > node.value {
                node.lowerNodeMinNode = node
            } else {
                node.lowerNodeMinNode = peek.lowerNodeMinNode
            }
        } else {
            node.lowerNodeMinNode = node
        }
        
        nodes.insert(node, at: 0)
    }
    
    func pop() -> MinStackNode? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        return nodes.removeFirst()
    }
    
    func peek() -> MinStackNode? {
        guard !nodes.isEmpty else {
            return nil
        }
        
        return nodes.first
    }
    
    func min() -> MinStackNode? {
        guard let peek = peek() else {
            return nil
        }
        
        return peek.lowerNodeMinNode
    }
}

final class MinStackNode {
    let value: Int
    var lowerNodeMinNode: MinStackNode?
    
    // MARK: - Init
    
    init(value: Int) {
        self.value = value
    }
}


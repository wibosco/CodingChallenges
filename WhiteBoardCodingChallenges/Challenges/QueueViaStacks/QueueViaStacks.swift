//
//  QueueViaStacks.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 3.4
class QueueViaStacks: NSObject {

    // MARK: Properties
    
    lazy var enqueueStack: QueueViaStacksStack = {
       
        return QueueViaStacksStack()
    }()
    
    lazy var dequeueStack: QueueViaStacksStack = {
        
        return QueueViaStacksStack()
    }()
    
    // MARK: Transfer
    
    private func transferContents(sourceStack: QueueViaStacksStack, destinationStack: QueueViaStacksStack) {
        
        for _ in 0..<sourceStack.nodes.count {
            
            destinationStack.push(value: sourceStack.pop())
        }
    }
    
    // MARK: Actions
    
    func enqueue(value: Int) {
        
        if !dequeueStack.isEmpty() {
            
            transferContents(sourceStack: dequeueStack, destinationStack: enqueueStack)
        }
        
        enqueueStack.push(value: value)
    }
    
    func dequeue() -> Int {
        
        if !enqueueStack.isEmpty() {
            
            transferContents(sourceStack: enqueueStack, destinationStack: dequeueStack)
        }
        
        return dequeueStack.pop()
    }
    
    func peek() -> Int {
        
        if !enqueueStack.isEmpty() {
            
            transferContents(sourceStack: enqueueStack, destinationStack: dequeueStack)
        }
        
        return dequeueStack.peek()
    }
}

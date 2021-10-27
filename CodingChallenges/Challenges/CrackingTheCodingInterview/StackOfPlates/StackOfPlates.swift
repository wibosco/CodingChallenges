//
//  StackOfPlates.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//CtCI 3.3
class StackOfPlates {

    // MARK: Properties
    
    private let stackCapacity = 2
    
    lazy var stacks: [StackOfPlatesStack] = {
       
        return [StackOfPlatesStack]()
    }()
    
    // MARK: Actions
    
    func push(value: Int) {
        
        var pushStack: StackOfPlatesStack
        
        if let stack = stacks.last {
            
            if stack.isFull() {
                
                pushStack = StackOfPlatesStack(capacity: stackCapacity)
                stacks.append(pushStack)
            }
            else {
                
                pushStack = stack
            }
        }
        else {
            
            pushStack = StackOfPlatesStack(capacity: stackCapacity)
            stacks.append(pushStack)
        }
        
        pushStack.push(value: value)
    }
    
    func pop() -> StackOfPlatesNode? {
        
        if let stack = stacks.last {
            
            let node = stack.pop()!
            
            if stack.isEmpty() {
                
                stacks.removeLast()
            }
            
            return node
        }
        
        return nil
    }
}

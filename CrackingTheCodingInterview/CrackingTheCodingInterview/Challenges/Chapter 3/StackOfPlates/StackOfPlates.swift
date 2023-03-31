//
//  StackOfPlates.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 3.3
final class StackOfPlates {
    private let stackCapacity = 2
    
    var stacks = [StackOfPlatesStack]()
    
    // MARK: - Actions
    
    func push(value: Int) {
        var pushStack: StackOfPlatesStack
        
        if let stack = stacks.last {
            if stack.isFull() {
                pushStack = StackOfPlatesStack(capacity: stackCapacity)
                stacks.append(pushStack)
            } else {
                pushStack = stack
            }
        } else {
            pushStack = StackOfPlatesStack(capacity: stackCapacity)
            stacks.append(pushStack)
        }
        
        pushStack.push(value: value)
    }
    
    func pop() -> StackOfPlatesNode? {
        guard let stack = stacks.last else {
            return nil
        }
        
        let node = stack.pop()!
        if stack.isEmpty() {
            stacks.removeLast()
        }
        
        return node
    }
}

//
//  QueueViaStacks.swift
//  CodingChallenges
//
//  Created by William Boles on 01/06/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//CtCI 3.4
class QueueViaStacks {
    private var enqueueStack = Stack()
    private var dequeueStack = Stack()
    
    // MARK: - Transfer
    
    private func transferContents(sourceStack: Stack, destinationStack: Stack) {
        while let value = sourceStack.pop() {
            destinationStack.push(value: value)
        }
    }
    
    // MARK: - Actions
    
    func enqueue(value: Int) {
        if !dequeueStack.isEmpty() {
            transferContents(sourceStack: dequeueStack, destinationStack: enqueueStack)
        }
        
        enqueueStack.push(value: value)
    }
    
    func dequeue() -> Int? {
        if !enqueueStack.isEmpty() {
            transferContents(sourceStack: enqueueStack, destinationStack: dequeueStack)
        }
        
        return dequeueStack.pop()
    }
    
    func peek() -> Int? {
        if !enqueueStack.isEmpty() {
            transferContents(sourceStack: enqueueStack, destinationStack: dequeueStack)
        }
        
        return dequeueStack.peek()
    }
}

private class Stack {
    
    // MARK: - Nodes
    
    private var stack = [Int]()
    
    // MARK: - Meta
    
    func isEmpty() -> Bool {
        return stack.isEmpty
    }
    
    // MARK: - Actions
    
    func push(value: Int) {
        stack.append(value)
    }
    
    func pop() -> Int? {
        return stack.popLast()
    }
    
    func peek() -> Int? {
        return stack.last
    }
}


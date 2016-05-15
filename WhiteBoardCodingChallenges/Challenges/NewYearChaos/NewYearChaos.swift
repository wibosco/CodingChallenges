//
//  NewYearChaos.swift
//  WhiteBoardCodingChallenges
//
//  Created by Home on 14/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/new-year-chaos
class NewYearChaos: NSObject {

    class func numberOfBribesToAchieveQueue(queue: [Int]) -> Int {
        
        var numberOfBribesToAchieveQueue = 0
        
        let maxmimumQueueJump = 2
        
        for index in 0..<queue.count {
            
            let expectedValueAtIndex = (index + 1)
            let actualValueAtIndex = queue[index]
            
            if (actualValueAtIndex - maxmimumQueueJump) > expectedValueAtIndex {
                
                return -1
            }
            else {
                
                if actualValueAtIndex > expectedValueAtIndex {
                    
                    numberOfBribesToAchieveQueue += actualValueAtIndex - expectedValueAtIndex
                }
                else {
                    
                    for nextIndex in index+1..<queue.count {
                        
                        let nextValue = queue[nextIndex]
                        
                        if actualValueAtIndex > nextValue {
                            
                            numberOfBribesToAchieveQueue += 1
                        }
                    }
                }
            }
        }
        
        return numberOfBribesToAchieveQueue
    }
    
    // MARK: Alt
    
    class func numberOfBribesToAchieveQueueAlt(queue: [Int]) -> Int {
     
        var inversions = 0
        
        if NewYearChaos.isValidQueue(queue) {
            
            for index in 0..<queue.count {
                
                let actualValueAtIndex = queue[index]
                
                var valuesBeforeThatAreGreaterThanCurrentValue = queue.count - index
                
                for previousValueIndex in 0..<index {
                    
                    let previousValue = queue[previousValueIndex]
                    
                    if previousValue > actualValueAtIndex {
                        
                        valuesBeforeThatAreGreaterThanCurrentValue -= 1
                    }
                }
                
                inversions += ((queue.count - index) - valuesBeforeThatAreGreaterThanCurrentValue)
            }
            
            return inversions
        }
        else {
            
            return -1
        }
    }
    
    class func isValidQueue(queue: [Int]) -> Bool {
    
        let maxmimumQueueJump = 2
        
        for index in 0..<queue.count {
            
            let expectedValueAtIndex = (index + 1)
            let actualValueAtIndex = queue[index]
            
            if (actualValueAtIndex - maxmimumQueueJump) > expectedValueAtIndex {
                
                return false
            }
        }
        
        return true
    }
}

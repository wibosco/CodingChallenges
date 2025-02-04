//
//  PushDominoes.swift
//  LeetCode
//
//  Created by William Boles on 14/07/2023.
//

import Foundation

//https://leetcode.com/problems/push-dominoes/
struct PushDominoes {
    
    //Time: O(n) where n is the number of elements in `dominoes`
    //Space: O(n)
    //array
    //string
    //caching
    //batching
    //three pointers
    //nested loops
    //
    //Solution Description:
    //As all dominoes move at the same time meaning that each affects (or not) it's neighbor at the same time we need to process
    //changes in state in batches. To do this we need two arrays of dominoes - `liveDominoes` and `cachedDominoes`. `liveDominoes`
    //array holds the state of dominoes at that exact moment which can be during a batch, `cachedDominoes` holds the state of
    //dominoes in-between batches. This allows us to update `liveDominoes` with the latest batch changes without those current
    //state changes affecting the states of further dominoes during that batch change - remember during a batch change all
    //dominoes are meant to be updated at the same time. At the end of a batch change we update `liveDominoes` with the latest
    //changes. We repeat this process until there are no changes made during a batch. The changes themself center around finding
    //"." indexes and comparing it's neighbors against each to see what change (if any) needs to occur - special care is given to
    //the start an end of the array.
    //
    //N.B. how `cachedDominoes` is used during the comparisons and and `liveDominoes` to hold the updated state.
    func pushDominoes(_ dominoes: String) -> String {
        var liveDominoes = Array(dominoes)
        var cachedDominoes = [Character]()
        
        while cachedDominoes != liveDominoes {
            cachedDominoes = liveDominoes
            
            for i in 0..<cachedDominoes.count {
                guard cachedDominoes[i] == "." else {
                    continue
                }
                
                let previousIndex = i - 1
                let nextIndex = i + 1
                
                if previousIndex >= 0 && nextIndex < cachedDominoes.count { //got both neighbors
                    let previousVal = cachedDominoes[previousIndex]
                    let nextVal = cachedDominoes[nextIndex]
                    
                    if previousVal == "." && nextVal == "." {
                        continue
                    }
                    
                    if previousVal == nextVal {
                        liveDominoes[i] = previousVal
                    } else if previousVal == "R" && nextVal == "." {
                        liveDominoes[i] = "R"
                    } else if previousVal == "." && nextVal == "L" {
                        liveDominoes[i] = "L"
                    }
                } else if previousIndex >= 0 { //at the end, only one neighbor
                    let previousVal = cachedDominoes[previousIndex]
                    if previousVal == "R" {
                        liveDominoes[i] = "R"
                    }
                } else if nextIndex < cachedDominoes.count { //at the start, only one neighbor
                    let nextVal = cachedDominoes[nextIndex]
                    if nextVal == "L" {
                        liveDominoes[i] = "L"
                    }
                }
            }
        }
        
        return String(liveDominoes)
    }
    
    //Time: O(n) where n is the number of elements in `dominoes`
    //Space: O(n)
    //array
    //string
    //queue
    //batching
    //
    //Solution Description:
    //As all dominoes move at the same time meaning that each affects (or not) it's neighbor at the same time we need to process
    //changes in state in batches. We can use a queue to do this as we ensure all changes at the first level are processed before
    //those at the next level. As only `L` and `R` elements can affect the state of their neighbors, our queue only hold these. We
    //work through the queue left to right. When we encounter an `R`, we check what the next index holds - if it's an "." we know
    //it has the potential to be changed but before we can change the change we need to check if the `.` elements right neighbor is
    //an `L`, it is then the `.` stays the way it is as the two neighbors balance it out; if it isn't we change it to an `R` and
    //add that new changeable state to our queue. It's important to note here that if the `.` elements other neighbor is an `L` then
    //we increment the queue index as we have effectively processed that next item in the queue as well which has the added benefit
    //of simplifying how we process `L` elements. When we encounter an `L` element in the queue and we have a left `.` element
    //neighbor we go ahead and update that neighbor to `L` as any other previous-previous neighbors will have already been processed
    //and so we know that there is an `R` element to balance this `L` - remember how we encounter an `R`, we check the next-next
    //neighbor. We repeat this process until the queue is empty.
    func pushDominoesQueue(_ dominoes: String) -> String {
        var dominoes = Array(dominoes)
        var queue = [(Int, Character)]() // [Index: DominoeValue]
        
        for (i, d) in dominoes.enumerated() {
            guard d != "." else {
                continue
            }
            
            queue.append((i, d))
        }
        
        while !queue.isEmpty {
            var newQueue = [(Int, Character)]()
            var queueIndex = 0
            
            while queueIndex < queue.count {
                let (i, d) = queue[queueIndex]
                
                if d == "R" {
                    let nextIndex = i + 1
                    if nextIndex < dominoes.count && dominoes[nextIndex] == "." {
                        let nextNextIndex = nextIndex + 1
                        if nextNextIndex < dominoes.count && dominoes[nextNextIndex] == "L" {
                            //neighbors balance each other so no change here
                            queueIndex += 1 //have already checked the next index so skip it
                        } else {
                            dominoes[nextIndex] = "R"
                            newQueue.append((nextIndex, "R"))
                        }
                    }
                } else if d == "L" {
                    let previousIndex = i - 1
                    if previousIndex >= 0 && dominoes[previousIndex] == "." {
                        dominoes[previousIndex] = "L"
                        newQueue.append((previousIndex, "L"))
                    }
                }
                
                queueIndex += 1
            }
            
            queue = newQueue
        }
        
        return String(dominoes)
    }
}

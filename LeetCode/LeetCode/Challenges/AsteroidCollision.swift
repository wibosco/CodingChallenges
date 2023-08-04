//
//  AsteroidCollision.swift
//  LeetCode
//
//  Created by William Boles on 18/01/2022.
//  Copyright © 2022 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/asteroid-collision/
struct AsteroidCollision {
    
    //Time: O(n) where n is the number of elements in `asteroids`
    //Space: O(n) where n is the number of elements in `asteroids`
    //array
    //stack
    //
    //Solution Description:
    //Iterate through `asteroids` and compare the current asteroid with it's predecessors which is stored in a stack. If those
    //asteroids are moving away from each other then add that current asteroid to the stack; if they are moving towards each other
    //check the absolute sizes of those asteroids. If they are the same size, remove the last asteroid from the stack and discard
    //it along with the current asteroid; if the current asteroid is larger then discard the stack asteroid and compare the current
    //asteroid with the next stack asteroid; if the current asteroid is smaller then discard it. Finally once all asteroids have
    //been processed, return the stack
    static func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [asteroids[0]]
        
        for curr in asteroids[1...] {
            var unstable = true
            
            while unstable {
                unstable = false
                
                guard let prev = stack.last, prev > 0 && curr < 0 else { //are they moving towards each other
                    stack.append(curr)
                    break
                }
                
                unstable = true
                
                let absCurr = abs(curr)
                let absPrev = abs(prev)
                
                if absCurr == absPrev {
                    stack.removeLast()
                    break
                } else if absCurr > absPrev {
                    stack.removeLast()
                    //keep looping to check the next element in the stack against curr
                } else {
                    break
                }
            }
        }
        
        return stack
    }
    
    //Time: O(n) where n is the number of elements in asteroids
    //Space: O(1)
    //array
    //
    //Solution Description:
    //Iterate through `asteroids` and find neighboring asteroids moving towards each other. When we do, check the absolute sizes
    //of those asteroids, if one is larger then the other then remove the smaller from the array; if both are the same size then
    //remove both. Reset the pointer `i` to allow for further comparisons. Finally once all asteroids have been processed and no
    //more asteroids are to be removed - return the remaining asteroids.
    static func asteroidCollisionRemoving(_ asteroids: [Int]) -> [Int] {
        var asteroids = asteroids
        
        var i = 0
        while i < (asteroids.count - 1) {
            var first = asteroids[i]
            var second = asteroids[(i + 1)]
            
            guard first > 0 && second < 0 else { //are they moving towards each other
                i += 1
                continue
            }
            
            first = abs(first)
            second = abs(second)
                        
            if first == second {
                asteroids.remove(at: (i + 1))
                asteroids.remove(at: (i))
                
                i = max(0, (i - 1))
            } else if first > second {
                asteroids.remove(at: (i + 1))
            } else {
                asteroids.remove(at: (i))
                
                i = max(0, (i - 1))
            }
        }
        
        return asteroids
    }
}

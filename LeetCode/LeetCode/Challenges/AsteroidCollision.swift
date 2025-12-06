// Created 18/01/2022.

import Foundation

//https://leetcode.com/problems/asteroid-collision/
struct AsteroidCollision {
    
    //Time: O(n) where n is the number of elements in `asteroids`
    //Space: O(n)
    //array
    //stack
    //fast foward
    //
    //Solution Description:
    //Iterate through `asteroids` and compare the current asteroid with it's predecessors which are stored in a stack. If those
    //asteroids are moving away from each other or moving in the same direction then the current asteroid can be added to the
    //stack as they will be collide; if they are moving towards each other then they will collidate and we need to determine the
    //outcome of that collision. If they are the same size then both will be destoried and so we can  remove the last asteroid from
    //the stack and discard it along with the current asteroid; if the current asteroid is larger then the stack asteroid is
    //discarded and the next asteroid on the stack is compared against the current asteroid (and the process repeats) if the
    //current asteroid is smaller then it is discarded. Once all asteroids have been processed, then the stack contains the
    //surviving asteroid and is returned.
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()

        //pos ->, neg <-

        for asteroid in asteroids {
            if asteroid < 0, let last = stack.last, last > 0 { //is the current asteroid moving towards those on the stack?
                //fast forward
                while let last = stack.last, last > 0, abs(asteroid) > last {
                    stack.removeLast()
                }

                if stack.isEmpty {
                    stack.append(asteroid)
                } else if let last = stack.last, last > 0, last == abs(asteroid) {
                    stack.removeLast()
                } else if let last = stack.last, last < 0 {
                    stack.append(asteroid)
                }
            } else {
                stack.append(asteroid)
            }
        }

        return stack
    }
    
    //Time: O(n) where n is the number of elements in `asteroids`
    //Space: O(n)
    //array
    //stack
    //
    //Solution Description:
    //Iterate through `asteroids` and compare the current asteroid with it's predecessors which are stored in a stack. If those
    //asteroids are moving away from each other then add that current asteroid to the stack; if they are moving towards each other
    //check the absolute sizes of those asteroids. If they are the same size, remove the last asteroid from the stack and discard
    //it along with the current asteroid; if the current asteroid is larger then discard the stack asteroid and compare the current
    //asteroid with the next stack asteroid; if the current asteroid is smaller then discard it. Finally once all asteroids have
    //been processed, return the stack.
    func asteroidCollision2(_ asteroids: [Int]) -> [Int] {
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
    func asteroidCollision3(_ asteroids: [Int]) -> [Int] {
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

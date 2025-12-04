// Created 04/12/2025.

import Foundation

//https://leetcode.com/problems/count-collisions-on-a-road/
struct CountCollisionsOnARoad {
    
    //Time: O(n) where n is the number of characters in `directions`.
    //Space: O(n) where n is the number of characters in `directions`.
    //stack
    //stack
    //array
    //
    //Solution Description:
    //After converting `directions` to a character array we iterate from left to right and some of the characters we encounter into
    //a stack. Whenever we encounter an `S` we reset the stack to only contain an `S` (`S` stack), whenever we encounter an `R` we
    //either reset the stack to only contain `R` or `append `R` to an existing stack of `R` (`R` stack). We can then use the stack
    //to count the number of collisions. Whenever we encounter an `L` element, we increment `count` by the number of elements in
    //`stack` and reset the stack to an `S` stack - if the stack was an `R` stack` we add increment count by 1 as the first
    //collision counts as 2. Whenever we encounter an `S` element we increment `count` by the number of elements in `stack` and
    //reset the stack to an `S` stack. Once all elements have been processed we can return `count`.
    func countCollisions(_ directions: String) -> Int {
        var stack = [Character]()
        let directions: [Character] = Array(directions)

        var count = 0

        for c in directions {
            if c == "L" {
                if let last = stack.last {
                    if last == "R" { //only double count the first collision
                        count += 1
                    }
                    
                    count += stack.count

                    stack = ["S"]
                }
            } else if c == "S" {
                if let last = stack.last, last != "S" {
                    count += stack.count
                }

                stack = ["S"] //needs to happen regardless of if the stack contained anything
            } else {
                if let last = stack.last, last != "S" {
                    stack.append("R")
                } else {
                    stack = ["R"]
                }
            }
        }

        return count
    }
}

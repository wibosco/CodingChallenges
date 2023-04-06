//
//  RemoveDuplicateLetters.swift
//  LeetCode
//
//  Created by William Boles on 06/04/2023.
//

import Foundation

//https://leetcode.com/problems/remove-duplicate-letters/
//string
struct RemoveDuplicateLetters {
    
    //Time: O(n) where `n` is the number of elements in `s`
    //Space: O(n)
    //monotonic increasing stack
    //dictionary
    //set
    //visited
    //
    //Solution Description:
    //Using an increasing montonic stack we are able to build the lexicographical ordered version of s. As characters can
    //appear multiple times in `s`, we build a frequency table of how often a character appears. Next we iterate through
    //`s`. During iteration we use the monotonic stack to determine if `c` should be added. If we have previously added
    //`c` we skip it; else we compare `c` against the last element in `stack`. If `c` is less than `last` and `last`
    //appear later in `s`, we remove `last` and iterate through the next element in the stack, eventually finding where
    //`c` should be in the stack. If `c` is greater than `last` or `last` will not appear again we add `c` to the stack
    //and `last` is already in it's final position. We then decrement the frequency of `c` and add it to `stackElements`
    //(to speed up searching of the stack). Think of `stackElements` a bit like `visited` set on a graph but here we
    //sometimes remove elements from it.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing
    //when it follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    static func removeDuplicateLetters(_ s: String) -> String {
        var stack = [Character]() //increasing monotonic stack
        let chars = Array(s)
        
        var frequency = [Character: Int]()
        var stackElements = Set<Character>() //speed up searching of stack to see if we need to remove an element
        
        for c in chars {
            frequency[c, default: 0] += 1
        }
        
        for c in chars {
            while !stackElements.contains(c) {
                guard let last = stack.last else {
                    stack.append(c)
                    break
                }
            
                if c < last && frequency[last]! > 0 { //only remove last if it less than c and will come up again in chars
                    stack.removeLast()
                    stackElements.remove(last)
                    
                    continue
                } else {
                    stack.append(c)
                    
                    break
                }
            }
            
            stackElements.insert(c)
            frequency[c]! -= 1
        }
        
        return String(stack)
    }
}

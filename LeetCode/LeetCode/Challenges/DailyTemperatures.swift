//
//  DailyTemperatures.swift
//  LeetCode
//
//  Created by William Boles on 14/12/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

//https://leetcode.com/problems/daily-temperatures/
//array
struct DailyTemperatures {
    
    //Time: O(n) where n is the number of temperatures (technically O(2n) because of the inner while - whats
    //           important to note here is that `stack` will only ever hold a total of n elements)
    //Space: O(n) where n is the number of temperatures
    //stack
    //monotonic stack
    //
    //Solution Description:
    //As we loop through the temperatures we push onto the stack any temperature that is less than the temperature at the
    //top of our monotonic decreasing stack. This ensures that the stack will be in decreasing order. If the temperature
    //is greater than the "top" of the stack then we pop that stack and determine the difference (in days) between the two
    //temperatures and store this in the "wait" array. We repeat this until the current temperature is smaller than the
    //top of the stack or the stack is empty.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing
    //when it follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    //See: https://www.youtube.com/watch?v=cTBiBSnjO3c
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var wait = Array(repeating: 0, count: temperatures.count)
        var stack = [Int]()
        
        for (i, temperature) in temperatures.enumerated() {
            while !stack.isEmpty {
                guard temperatures[stack.last!] < temperature else {
                    break
                }
                
                let j = stack.removeLast()
                wait[j] = i - j
            }
            stack.append(i)
        }
        
        return wait
    }
    
    //Time: O(n^2) where n is the number of temperatures
    //Space: O(n) where n is the number of temperatures
    //
    //Solution Description:
    //The outer loop, loops through each temperature in order with the inner loop lopping through the temperatures after
    //the outer loop's temperature. A check is made to test if the inner temperature is greater than the outer. If so the
    //difference in days is added to the `wait` array and the inner loop breaks, if not the inner continues searching.
    func dailyTemperaturesTwoLoops(_ temperatures: [Int]) -> [Int] {
        var wait = Array(repeating: 0, count: temperatures.count)
        for i in 0..<temperatures.count {
            for j in (i + 1)..<temperatures.count {
                if temperatures[j] > temperatures[i] {
                    wait[i] = (j - i)
                    break
                }
            }
        }
        
        return wait
    }
}

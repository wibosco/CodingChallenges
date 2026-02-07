// Created 14/12/2021.

import Foundation

//https://leetcode.com/problems/daily-temperatures/
//array
struct DailyTemperatures {
    
    //Time: O(n) where n is the number of elements in `temperatures`
    //Space: O(n)
    //stack
    //monotonic stack
    //
    //Solution Description:
    //Rather than attempting to determine the "next" temperature that is greater than the current temperature we instead
    //inverse this by determing if there are any temperatures before that the current temperature that are smaller than
    //the current temperature. As we are only interested in the "next" greater temperature, once a temperature has found
    //it's "next" temperature we don't have to check that temperature again. We do this in O(n) time with a monotonic
    //stack. The monotonic stack will hold all temperatures whose "next" temperature hasn't been found in descending
    //order i.e. 78 -> 76 -> 67, etc. As we loop through `temperatures` we will compare the current temperature against
    //those elements in the stack. If the current temperature is greater than the stack elements we will pop the stack
    //elements and update their "next" value in `result` by taking the difference between the current index and the
    //stack index. We repeat for all stack elements until either the stack is empty or we encounter a temperature that
    //is greater than or equal to the current temperature. We can then add the current temperature to `stack` and repeat
    //this process. Once all elements in `temperatures` have been processed we can then return `result`.
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
        var result = Array(repeating: 0, count: temperatures.count)

        var stack = [Int]() //[index]

        for i in 0..<temperatures.count {
            while let last = stack.last, temperatures[last] < temperatures[i] {
                result[last] = (i - last)
                stack.removeLast()
            }

            stack.append(i)
        }

        return result
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

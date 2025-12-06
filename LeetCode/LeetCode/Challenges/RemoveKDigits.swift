// Created 28/07/2023.

import Foundation

//https://leetcode.com/problems/remove-k-digits/
struct RemoveKDigits {
    
    //Time: O(n) where n is the number of characters in `num`
    //Space: O(n)
    //array
    //string
    //stack
    //monotonic stack
    //greedy
    //
    //Solution Description:
    //We iterate through `num` and add the elements that we encounter to `stack`. Using a greedy approach if `n` is less than
    //the last element added to the stack and we have remaining removals, we pop that last element - we repeat this process
    //until either the stack is empty, we can't remove any more of we encounter a value on the stack which is equal to or less
    //than `n`. We repeat this process until all elements in `num` have been processed. We then do some house keeping and
    //convert the remaining elements in the stack into a string to be returned.
    //
    //Background:
    //Monotonic = It is a word for mathematics functions. A function y = f(x) is monotonically increasing or decreasing when it
    //follows the below conditions:
    //
    //As x increases, y also increases always, then it’s a monotonically increasing function.
    //As x increases, y decreases always, then it’s a monotonically decreasing function.
    //
    //See: https://www.geeksforgeeks.org/introduction-to-monotonic-stack-data-structure-and-algorithm-tutorials/
    func removeKdigits(_ num: String, _ k: Int) -> String {
        var stack = [Character]()
        var remainingRemovals = k
        
        for n in num {
            while remainingRemovals > 0,
                  let last = stack.last,
                  n < last {
                stack.removeLast()
                remainingRemovals -= 1
            }
            
            if stack.isEmpty && n == "0" {
                //skipping over leading zeros, this doesn't count as a removal
                continue
            }
            
            stack.append(n)
        }
        
        if stack.isEmpty || remainingRemovals >= stack.count {
            return "0"
        }
        
        stack.removeLast(remainingRemovals)
        
        return String(stack)
    }
}

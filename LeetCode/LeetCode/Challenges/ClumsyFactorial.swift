// Created 12/05/2025.

import Foundation

//https://leetcode.com/problems/clumsy-factorial/
struct ClumsyFactorial {
    
    //Time: O(n)
    //Space: O(n)
    //stack
    //modulo
    //
    //Solution Description:
    //We iterate from `n` to `1`. At each iteration, we store the result of that iteration in a stack. We use a stack so that
    //(if needed) we can get the result of the previous iteration to use in the current iteration. For multiplication and
    //division, we perform the calculation immediately and store the result in the stack; for addition and subtraction, we
    //store `i` in the stack so that the calculation can be performed later (after all multiplication and division operations
    //have been performed). Once all iterations from `n` to `1` are complete, we sum the values in the stack (this has the
    //effect of performing the addition and subtraction operations) and return that sum as `total`.
    //
    //Similar to: https://leetcode.com/problems/evaluate-reverse-polish-notation/
    func clumsy(_ n: Int) -> Int {
        var stack = [Int]()
        stack.append(n)
        
        var operation = 0
        for i in (1..<n).reversed() {
            switch operation {
            case 0: // `*`
                let val = stack.removeLast()
                stack.append((val * i))
            case 1: // `/`
                let val = stack.removeLast()
                stack.append((val / i))
            case 2: // `+`
                stack.append(i)
            default: // `-`
                stack.append((i * -1))
            }
            
            operation = ((operation + 1) % 4)
        }
        
        var total = 0
        for val in stack {
            total += val
        }
        
        return total
    }
}

// Created 09/09/2024.

import Foundation

//https://leetcode.com/problems/sum-of-square-numbers/
struct SumOfSquareNumbers {

    //Time: O(n) where n is the range of 0 to `sqrt(c)`
    //Space: O(1)
    //two pointers
    //linear scan
    //
    //Solution Description:
    //In order for `a^2 + b^2 = c` we know the maximum value of either `a` or `b` (not both) will be `sqrt(c)` as either of those 
    //values squared will be `c` so as we know that our range of possible values for `a` and `b` is `0...sqrt(c)`. With a sorted
    //range we can break this problment down into a two pointers. `a` starts at `0` and `b` at `sqrt(c)`, each iteration through
    //the while loop we sum `a` and `b` together and compare that value against `c` - if `sum` == `c` then we have found our match
    //and can return true; if `sum` > `c` then we need to reduce `sum` by decrementing `b` which moves `b` onto a lower value in
    //our range; if `sum` < `c` then we need to increase `sum` by incrementing `a` which moves `a` onto a higher value in our
    //range. Once `a` and `b` we start repeating previously calculated sums so we end the loop and return false.
    func judgeSquareSum(_ c: Int) -> Bool {
        //rule: `a^2 + b^2 = c`
        var a = 0
        var b = Int(Float(c).squareRoot())
        
        while a <= b { //it is valid for `a` and `b` to be the same value
            let sum = (a * a) + (b * b)
            if sum == c {
                return true
            } else if sum > c {
                //make sum smaller
                b -= 1
            } else {
                //make sum larger
                a += 1
            }
        }
        
        return false
    }
}

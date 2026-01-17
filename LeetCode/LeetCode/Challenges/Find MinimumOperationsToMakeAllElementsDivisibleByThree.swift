// Created 17/01/2026.

import Foundation

//https://leetcode.com/problems/find-minimum-operations-to-make-all-elements-divisible-by-three/
struct MinimumOperationsToMakeAllElementsDivisibleByThree {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //modulo
    //
    //Solution Description:
    //Using the modulo operation we can determine if an operation needs to be performed on an element of `nums` if after the
    //modulo operation the output is zero. If the output is zero then no operation be required; if the output is not `0` then
    //only one operation is required and we can increment `operations` by 1. There is only ever one operation required
    //because either adding or subtracting from `num` will get you to a value that is divisible by 3 i.e. if the output is `1`
    //then subtract one from that element of `nums`; if the output is `2` then add one to that element of `nums`. Once all
    //elements of `nums` have been processed we return `operations`.
    func minimumOperations(_ nums: [Int]) -> Int {
        var operations = 0

        for num in nums {
            if num % 3 != 0 {
                operations += 1
            }
        }

        return operations
    }
}

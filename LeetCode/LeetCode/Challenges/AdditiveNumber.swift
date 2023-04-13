//
//  AdditiveNumber.swift
//  LeetCode
//
//  Created by William Boles on 03/04/2023.
//

import Foundation

//https://leetcode.com/problems/additive-number/
//string
struct AdditiveNumber {
    
    // MARK: - Pointers
    
    //Time: O(n^2) where n is the number of elements in `num`
    //Space: O(n)
    //array
    //three pointers
    //graph theory
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `nums` as graph, we build each possible starting permutation of `n1` + `n2` = `result` and then perform a
    //DFS search from those starting positions. To begin with we attempt to find is `num` is additive by using the fewest
    //possible elements in `nums` i.e. nums[0] and nums[1] and checking if the next 1 or 2 elements (the sum of two
    //digits can be either 1 or 2 elements in length i.e. 1+1=2 or 9+5=14) in `nums` match the sum of nums[0] and nums[1].
    //If `sum` and `result` match then we move the search deeper on that branch by moving `n2` into `n1`s position,
    //`result` into `n2`position and the start of the next result to `resultEndIndex`; if `sum` and `result` don't match
    //then we know the starting positions of this branch where not valid and we exit the recursion and create a new
    //permutation by increasing the number of elements in either `n1` or `n2`. If we reach the end of `nums` and have
    //found at least one additive number during the searcg then we know that `nums` is additive and can return true.
    //
    //N.B. The permutataions will look like:
    //
    //num = "1899117"
    // [1] [8] [99117]
    // [1] [89] [9117]
    // [1] [899] [117]
    // [1] [8991] [17]
    // [1] [89911] [7]
    // [18] [9] [9117]
    // [18] [99] [117] <--- this solution would stop here
    // [18] [991] [17]
    // [18] [9911] [7]
    // [189] [9] [117]
    // [189] [91] [17]
    // [189] [911] [7]
    // [1899] [1] [17]
    // [1899] [11] [7]
    // [18991] [1] [7]
    static func isAdditiveNumber(_ num: String) -> Bool {
        guard num.count > 2 else {
            return false
        }
        
        let nums = Array(num)
        
        for i in 1..<(nums.count - 1) {//need at least the last element in `num` to be the result
            if nums[0] == "0" && i > 1 {
                break //there is no way to overcome a leading zero on the first value so `num` can't be additive
            }
            
            for j in (i+1)..<nums.count {
                if nums[i] == "0" && (j - i) > 1 { //a leading zero shows that this version of the second value is invalid
                    break
                }
                
                let found = isAdditiveNumber(nums, 0, i, j, false)
                
                if found { //if found is false we want to continue searching so we only return true values
                    return true
                }
            }
        }
        
        return false
    }
    
    private static func isAdditiveNumber(_ nums: [Character], _ n1StartIndex: Int, _ n2StartIndex: Int, _ resultStartIndex: Int, _ found: Bool) -> Bool {
        guard resultStartIndex < nums.count else {
            return found //found is used to know if an additive number was found in the previous loop
        }
        
        let n1 = Int(String(nums[n1StartIndex..<n2StartIndex]))!
        let n2 = Int(String(nums[n2StartIndex..<resultStartIndex]))!
        
        let sum = String((n1 + n2))
        
        let resultEndIndex = (resultStartIndex + sum.count) //a matching `result` value will have the same length as `sum`
        
        guard nums.count >= resultEndIndex else {
            return false
        }
        
        let result = String(nums[resultStartIndex..<resultEndIndex])
        
        if sum == result {
            //move everything forward and check the next combinations
            return isAdditiveNumber(nums, n2StartIndex, resultStartIndex, resultEndIndex, true)
        }
        
        return false
    }
    
    // MARK: - Array
    
    //Time: O(n^2) where n is the number of elements in `num`
    //Space: O(n)
    //array
    //three pointers
    //graph theory
    //DFS
    //recursive
    //
    //Solution Description:
    //Treating `nums` as graph, we build each possible starting permutation of `n1` + `n2` = `result` and then perform a
    //DFS search from those starting positions. To begin with we attempt to find is `num` is additive by using the fewest
    //possible elements in `nums` i.e. nums[0] and nums[1] and checking if the next 1 or 2 elements (the sum of two digits
    //can be either 1 or 2 elements in length i.e. 1+1=2 or 9+5=14) in `nums` match the sum of nums[0] and nums[1]. If `sum`
    //and `result` match then we move the search deeper on that branch by moving `n2` into `n1`s position, `result` into `n2`
    //position and the start of the next result to `resultEndIndex`; if `sum` and `result` don't match then we know the
    //starting positions of this branch where not valid and we exit the recursion and create a new permutation by increasing
    //the number of elements in either `n1` or `n2`. If we reach the end of `nums` and have found at least one additive
    //number during the searcg then we know that `nums` is additive and can return true.
    //
    //N.B. The permutataions will look like:
    //
    //num = "1899117"
    // [1] [8] [99117]
    // [1] [89] [9117]
    // [1] [899] [117]
    // [1] [8991] [17]
    // [1] [89911] [7]
    // [18] [9] [9117]
    // [18] [99] [117] <--- this solution would stop here
    // [18] [991] [17]
    // [18] [9911] [7]
    // [189] [9] [117]
    // [189] [91] [17]
    // [189] [911] [7]
    // [1899] [1] [17]
    // [1899] [11] [7]
    // [18991] [1] [7]
    static func isAdditiveNumberArray(_ num: String) -> Bool {
        guard num.count > 2 else {
            return false
        }
        
        let nums = Array(num)
        
        for i in 1..<(nums.count - 1) {
            let n1 = nums[0..<i]
            
            if n1[0] == "0" && n1.count > 1 {
                break
            }
            
            for j in (i+1)..<nums.count {
                let n2 = nums[i..<j]
                
                if n2[i] == "0" && n2.count > 1 { //the way array slices work in Swift the first element in `n2` isn't at index 0
                    break
                }
                
                let found = isAdditiveNumber(Array(n1), Array(n2), Array(nums[j...]), false)
                
                if found { //if found is false we want to continue searching
                    return true
                }
            }
        }
        
        return false
    }
    
    private static func isAdditiveNumber(_ n1: [Character], _ n2: [Character], _ nums: [Character], _ found: Bool) -> Bool {
        guard nums.count > 0 else {
            return found
        }
        
        let sum = String(Int(String(n1))! + Int(String(n2))!)
        
        let resultEndIndex = min(nums.count, sum.count) //take the min so we don't go out-of-bounds
        
        let result = String(nums[0..<resultEndIndex])
        
        if sum == result {
            return isAdditiveNumber(n2, Array(result), Array(nums[resultEndIndex...]), true)
        }
        
        return false
    }
}

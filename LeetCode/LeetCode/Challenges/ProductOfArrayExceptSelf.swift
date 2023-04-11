//
//  ProductOfArrayExceptSelf.swift
//  LeetCode
//
//  Created by William Boles on 31/03/2022.
//

import Foundation

//https://leetcode.com/problems/product-of-array-except-self/
//array
struct ProductOfArrayExceptSelf {
    
    //Time: O(n)
    //Space: O(1)
    //
    //Solution Description:
    //If we have the total value of `nums` then to exclude any value will be as if we took that total and divided it by the
    //value. What makes this trickier is that `nums` can contain zeros. If `nums` contains one zero then the only element in
    //the `result` array that won't be zero is that zero element. If `nums` contains multuple zeros then all elements in
    //`result` will be zero
    static func productExceptSelf(_ nums: [Int]) -> [Int] {
        var zeroCount = 0
        var total = 1
        var nonZeroTotal = 1
        
        for num in nums {
            total *= num
            
            if num != 0 {
                nonZeroTotal *= num
            } else {
                zeroCount += 1
            }
        }
        
        var result = Array(repeating: 0, count: nums.count)
        
        guard zeroCount < 2 else {
            return result
        }
        
        for i in 0..<nums.count {
            let num = nums[i]
            if zeroCount == 0 {
                result[i] = total / num
            } else if num == 0 {
                result[i] = nonZeroTotal
            }
        }
        
        return result
    }
    
    //Time: O(n) `n` is the number of elements in `nums`
    //Space: O(n)
    //reversing
    //
    //Solution Description:
    //We make three passes of `nums`. The first pass which goes from left-to-right (i.e. 0...n) sets the product of `i`
    //to be the product of `0..<i` (notice how we only use `nums[i]` after we assign `left` to `i`) which effectively
    //omits `i` from its location. The second pass which goes from right-to-left (i.e `n...0`) and sets the product of
    //`(i + 1)...` (notice again how we only use `nums[i]` after we assign `right` to `i`). The third combines the two
    //previous passes this way we end up with a result that for each element contains `0..<i` * `(i + 1)...` - note
    //that `i` itself has been excluded.
    //
    //We just make one pass through `nums` to set up a "prefixProduct" as `nums` can contain 0s which would make any
    //products that came after it 0 but if the `i` index to omitted was that 0 then all those 0 products `i...` would
    //be invalid and need to be recalculated. By making two passes left-to-right and right-to-left we can successfully
    //omit any 0 indexes from our `prefixProducts`. If there exists more than one 0 then our product would still be 0
    //but this is to be expected.
    static func productExceptSelfProducts(_ nums: [Int]) -> [Int] {
        var productsFromTheLeft = Array(repeating: 1, count: nums.count)
        var leftProduct = 1
        for i in 0..<nums.count {
            productsFromTheLeft[i] = leftProduct
            leftProduct = nums[i] * leftProduct //we only apply `nums[i]` after we assign `left` to `i` that way we exclude `nums[i]`
        }
        
        var productsFromTheRight = Array(repeating: 1, count: nums.count)
        var rightProduct = 1
        for i in (0..<nums.count).reversed() {
            productsFromTheRight[i] = rightProduct
            rightProduct = nums[i] * rightProduct //we only apply `nums[i]` after we assign `right` to `i` that way we exclude `nums[i]`
        }
        
        var products = [Int]()
        for i in 0..<nums.count {
            let product = productsFromTheLeft[i] * productsFromTheRight[i]
            products.append(product)
        }
        
        return products
    }
}

// Created 31/03/2022.

import Foundation

//https://leetcode.com/problems/product-of-array-except-self/
struct ProductOfArrayExceptSelf {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //reversing
    //prefix sum
    //
    //Solution Description:
    //We can determine the product of the array excluding by using a twist on prefix sum. Rather than simply
    //building a prefix array, we will also build a suffix array. This will allow us to determine what the
    //arrya product would be if `self` (i.e. the value at the current index) didn't exist. We do this by taking
    //the product of the prefix before `self` and multiplying it with the product of the suffix after `self` e.g
    //
    //For: [1,2,3,4]
    //
    //Prefix product is: [1,1,2,6]
    //Suffix product is: [24,12,4,1]
    //
    //Answer: [24,12,8,6]
    //
    //so if the element at index 1 (`2`) was excluded then the product for `[1,3,4]` would be `12`, which is
    //`prefix[1] * suffix[1]` i.e. `1 * 12`. Now, notice what is strange about the prefix product array: we
    //don't store the product of the whole array (`24`). This is because that value would never be used - it
    //would fall off the end of the array. Instead, we store the empty product `1` (i.e. nothing has been
    //multiplied yet) at index 0. This allows us to use the same index for `nums` as for `prefixProducts` when
    //determining the product excluding `self`. The same is true for the suffix product array, just with the
    //empty product `1` coming at the end. When we have our prefix and suffix arrays, we can then iterate
    //through `nums` and populate `ans` with the correct products.
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var prefixProducts = Array(repeating: 1, count: nums.count)
        var prefixProduct = 1
        for i in 0..<nums.count {
            prefixProducts[i] = prefixProduct //note, we assign before multipling so the product at `i` is up but not including `i`
            prefixProduct = nums[i] * prefixProduct
        }
        
        var suffixProducts = Array(repeating: 1, count: nums.count)
        var suffixProduct = 1
        for i in (0..<nums.count).reversed() { //note, the reverse as the suffix is being calculated
            suffixProducts[i] = suffixProduct //note, we assign before multipling so the product at `i` is up but not including `i`
            suffixProduct = nums[i] * suffixProduct
        }
        
        var ans = [Int]()
        for i in 0..<nums.count {
            let product = prefixProducts[i] * suffixProducts[i]
            ans.append(product)
        }
        
        return ans
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //reversing
    //prefix sum
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
    func productExceptSelf2(_ nums: [Int]) -> [Int] {
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
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //reversing
    //prefix sum
    //
    //Solution Description:
    //To avoid having to make nested loops through `nums` to calculate the product while excluding `self`, we crete two
    //prefix sum (actually prefix product) arrays one populating the array going from left -> right and one populating
    //going from right -> left. These prefix sum arrays are one element longer than `nums` to accommodate a `1` value that
    //represents the edge of either array. With these two prefix sum arrays we can iterate through `forwardPrefixSum` and
    //calculate the product of `nums` if `self` was excluded.
    func productExceptSelf3(_ nums: [Int]) -> [Int] {
        var forwardPrefixSum = [1]
        var product = 1

        for num in nums {
            product *= num
            forwardPrefixSum.append(product)
        }

        var backwardPrefixSum = [1]
        product = 1

        for num in nums.reversed() {
            product *= num
            backwardPrefixSum.append(product)
        }

        backwardPrefixSum.reverse()

        var p1 = 1

        var result = [Int]()

        while p1 < forwardPrefixSum.count {
            //note the `(p1 - 1)` when accessing `forwardPrefixSum` we we want to get the product up to but
            //no including `p1`. We don't need to offset `backwardPrefixSum` as this is already padded by
            //the extra `1` so the value at `p1` already excludes what the true `p1` would be.
            let val = forwardPrefixSum[(p1 - 1)] * backwardPrefixSum[p1]
            result.append(val)

            p1 += 1
        }

        return result
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //If we have the total value of `nums` then to exclude any value will be as if we took that total and divided it by the
    //value. What makes this trickier is that `nums` can contain zeros. If `nums` contains one zero then the only element in
    //the `result` array that won't be zero is that zero element. If `nums` contains multiple zeros then all elements in
    //`result` will be zero
    func productExceptSelf4(_ nums: [Int]) -> [Int] {
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
}

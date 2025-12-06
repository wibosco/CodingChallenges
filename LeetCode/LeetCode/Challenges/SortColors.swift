// Created 16/03/2022.

import Foundation

//https://leetcode.com/problems/sort-colors/
struct SortColors {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sorting
    //counting sort
    //
    //Solution Description:
    //We can count the number of 0s and 1s (no need to count 2s as an difference between `zeroCount` + `oneCount` and `nums`
    //is the 2 count) in `nums`. We then iterate through `nums` to replace the indexes we encounter with 0s until we exhaust
    //that count, move onto 1s and exhaust that count and finally move onto 2s for the remainder of the elements.
    //
    //See: https://en.wikipedia.org/wiki/Counting_sort
    func sortColors(_ nums: inout [Int]) {
        var zeroCount = 0
        var oneCount = 0
        
        for num in nums {
            if num == 0 {
                zeroCount += 1
            } else if num == 1 {
                oneCount += 1
            }
            //no need to count twos
        }
        
        for i in 0..<nums.count {
            if zeroCount > 0 {
                nums[i] = 0
                zeroCount -= 1
            } else if oneCount > 0 {
                nums[i] = 1
                oneCount -= 1
            } else {
                nums[i] = 2
            }
        }
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sorting
    //two pointers
    //
    //Solution Description:
    //We have three sections to nums: 0, 1, 2. We can place all 0s at the start of the array and all 2s at the end of
    //nums (with the 1s in the middle). To achieve this we need to need to have a pointer (`p0`) at the boundary
    //(outside) of the 0 subarray so when we encounter any 0s we can place them there and a pointer (`p2`) at the
    //boundary (outside) of the 2 subarray so when we encounter any 2s we can place them there. So when we encounter
    //a 0 we swap that 0 with the element at p0 and push p0 out so that the zero is now part of the 0 subarray. If we
    //a 2 we swap that 2 with the element at p2 and push p2 out so that the two is not of the 2 subarray. If we
    //encounter a one we just increment `current` as the 1 is already in the 1 subarray.
    //
    //See: https://en.wikipedia.org/wiki/Dutch_national_flag_problem
    func sortColors2(_ nums: inout [Int]) {
        var p0 = 0
        var current = 0
        var p2 = nums.count - 1
        
        while current <= p2 {
            if nums[current] == 0 {
                nums.swapAt(p0, current)
                
                p0 += 1
                current += 1 //p0 was moved into the `current` index - we have already check that so no need to do it again
            } else if nums[current] == 2 {
                nums.swapAt(current, p2)
                
                p2 -= 1
                //we don't know what was moved into the `current` index so need to check it
            } else {
                current += 1
            }
        }
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(1)
    //array
    //sorting
    //two pointers
    //fast forward
    //
    //Solution Description:
    //Using two pointer we iterate through `nums` - first sorting `0` and then `1` values. First we move `p1` onto the first
    //non-zero index then coming from the opposite end of `nums` we move every `0` element we encounter to index `p1` which we
    //then increment. We repeat this process until `p1` crosses `p2`. Without resetting `p1` we then move it onto the first
    //non-one index and following the same process as we used for `0`, this time we swap every `1` element with the value at
    //index `p1`. Once the `0` and `1` elements have been sorted, the `2` elements have also been sorted and we can exit.
    func sortColors3(_ nums: inout [Int]) {
        var p1 = 0
        var p2 = nums.count - 1
        
        //order `0`
        while p1 < p2, nums[p1] == 0 { //move `p1` onto first non-zero index
            p1 += 1
        }

        while p1 < p2 {
            if nums[p2] == 0 {
                nums.swapAt(p1, p2)

                while p1 < p2, nums[p1] == 0 { //move `p1` onto next non-zero index
                    p1 += 1
                }
            }

            p2 -= 1
        }

        //order `1`
        p2 = nums.count - 1

        while p1 < p2, nums[p1] == 1 { //move `p1` onto first non-one index
            p1 += 1
        }

        while p1 < p2 {
            if nums[p2] == 1 {
                nums.swapAt(p1, p2)

                while p1 < p2, nums[p1] == 1 { //move `p1` onto next non-one index
                    p1 += 1
                }
            }

            p2 -= 1
        }
        
        //`2` is already sorted
    }
}

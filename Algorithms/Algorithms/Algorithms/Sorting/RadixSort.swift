// Created 22/05/2022.

import Foundation

struct RadixSort {
    
    //Time: O(n * k) where n is the number of elements in `nums`, k is the number of digits of the largest number
    //Space: O(n) two buckets
    //sorting
    //radix sort (LSD)
    //
    //Solution Description:
    //Using radix sort we start with the least significant digit (LSD - left) in each element of `nums` and place that element
    //into a bucket using that digit as the "key". We then reconstruct `nums` by extracting the elements from the buckets in
    //ascending order of bucket keys. As we extract elements from each bucket it is essential that we maintain the order of the
    //elements in that bucket as this ordering (along with the bucket ordering) is gradually sorting `nums`. We repeat the
    //bucket sorting with the new ordering of `nums` and the next digit of each element in `nums` (if some elements don't have
    //a next digit 0 is assumed) until there as no more digits to be sorted.
    //
    //N.B. As `nums` can contain negative values we need two sets of buckets. We extract from the negative buckets (in reverse
    //order) first and then extract from the positive buckets.
    //
    //N.B. Radix sort is not a comparison sort
    //
    //Similar to counting sort in that buckets are used
    static func sort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var nums = nums
        
        let base = 10 //we need the base to allow us to move between different digits in each `nums` element
        var sorted = false
        var digitColumn = 1
        
        while !sorted {
            sorted = true
            
            var negativeBuckets = Array(repeating: [Int](), count: base) //ignore `0` in this array
            var positiveBuckets = Array(repeating: [Int](), count: base)
            
            for num in nums {
                let shiftedNum = num / digitColumn //move the digit we are interested in to the unit column
                let digit = shiftedNum % base //extract the unit column value as a single digit
                
                if digit >= 0 {
                    positiveBuckets[digit].append(num)
                } else {
                    negativeBuckets[abs(digit)].append(num)
                }
                
                if shiftedNum != 0 {
                    sorted = false
                }
            }
            
            digitColumn *= base //move onto the next digit column e.gg unit -> tens or hundreds -> thousands
            
            //reconstruct `nums` with the "slightly more sorted" elements
            nums = negativeBuckets.reversed().flatMap { $0 } //9 is actually -9 so we need to reverse ordering
            nums += positiveBuckets.flatMap { $0 }
        }
        
        return nums
    }
}

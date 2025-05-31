// Created 31/05/2025.

import Foundation

//https://leetcode.com/problems/product-of-two-run-length-encoded-arrays/
struct ProductOfTwoRunLengthEncodedArrays {
    
    //Time: O(n) where n is the number of elements on `encoded1` (or `encoded2` as both have the same length)
    //Space: O(n)
    //two pointers
    //array
    //
    //Solution Description:
    //Using two pointer we terate through both `encoded1` and `encoded2` we calcualte the product and then add that produced to the
    //`encoded` 2D array. When adding the product we either add it as a new element or we add it to the last element in `encoded`
    //if they have the same value. To calculate the frequency of the product we take the minimum frequency of the values that made
    //it. Once `encoded` has been updated we then update `encoded1` and `encoded2` with the "unused" frequency of their values. At
    //least one frequency will drop to 0 but it might be both. We increment the pointer of any frequency that has now dropped to 0
    //and repeat the process. Once all elements have been processed we return `encoded`.
    func findRLEArray(_ encoded1: [[Int]], _ encoded2: [[Int]]) -> [[Int]] {
        var encoded1 = encoded1
        var encoded2 = encoded2

        var p1 = 0
        var p2 = 0

        var encoded = [[Int]]() //[val, freq]

        while p1 < encoded1.count, p2 < encoded2.count {
            let val1 = encoded1[p1][0]
            let freq1 = encoded1[p1][1]
            let val2 = encoded2[p2][0]
            let freq2 = encoded2[p2][1]

            let prod = (val1 * val2)
            let freq = min(freq1, freq2)

            if let last = encoded.last, last[0] == prod {
                let previousFreq = encoded.removeLast()[1]
                encoded.append([prod, (previousFreq + freq)])
            } else {
                encoded.append([prod, freq])
            }
            
            encoded1[p1][1] -= freq
            encoded2[p2][1] -= freq

            if encoded1[p1][1] == 0 {
                p1 += 1
            }

            if encoded2[p2][1] == 0 {
                p2 += 1
            }
        }

        return encoded
    }
}

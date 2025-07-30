// Created 30/07/2025.

import Foundation

//https://leetcode.com/problems/find-lucky-integer-in-an-array/
struct FindLuckyIntegerInAnArray {
    
    //Time: O(n + m) where n is the number of elements in `arr`
    //               where m is the number of distinct elements in `arr`
    //Space: O(m)
    //array
    //dictionary
    //frequency
    //counting
    //
    //Solution Description:
    //Using a frequency dictionary we iterate through `arr` and count of each value there is. We then iterate through all key and
    //value pairs in `frequency` and if those two values match we assign `key` to `lucky` if `key` is larger than `lucky`. 
    func findLucky(_ arr: [Int]) -> Int {
        var frequency = [Int: Int]()

        for val in arr {
            frequency[val, default: 0] += 1
        }

        var lucky = -1

        for (key, count) in frequency {
            if count == key {
                lucky = max(lucky, key)
            }
        }

        return lucky
    }
}

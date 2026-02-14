// Created 14/02/2026.

import Foundation

//https://leetcode.com/problems/minimum-deletions-to-make-string-balanced/
struct MinimumDeletionsToMakeStringBalanced {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n)
    //array
    //counting
    //multi-pass
    //pre-processing
    //
    //Solution Description:
    //To balance `s`, there needs to be an index (pivot) where all elements to the left are `a` and all elements to the right
    //are `b` - it doesn't matter what that element is as it will fit into either group. This means that for any given index we
    //need to know the `b` count to the left and the `a` count to the right so that these elements can be deleted. Rather than
    //calculating these values for each index, we can store the `a` and `b` count for any given index and use those those two
    //values to calculate and use those values to determine the deletions required to balance that index if it was the pivot
    //index. So we first iterate through `nums` in order and store the count of `b` elements seen for each index, we then
    //iterate through `nums` again but thise time in reverse and store the count of `a` elements seen for each index. With
    //these two count arrays we then iterate through `nums` again and calculate the deletions needed for that index to be the
    //pivot index. We store the minimum deletions in `minDeletions`. When all indexes in `nums` has been checked we can return
    //`minDeletions`.
    func minimumDeletions(_ s: String) -> Int {
        let s = Array(s)

        var bCountToLeft = Array(repeating: 0, count: s.count)
        var bCount = 0
        for i in 0..<s.count {
            bCountToLeft[i] = bCount
            
            if s[i] == "b" {
                bCount += 1
            }
        }

        var aCountToRight = Array(repeating: 0, count: s.count)
        var aCount = 0
        for i in (0..<s.count).reversed() {
            aCountToRight[i] = aCount
            if s[i] == "a" {
                aCount += 1
            }
        }

        var minDeletions = s.count
        for i in 0..<s.count {
            let deletions = aCountToRight[i] + bCountToLeft[i]
            minDeletions = min(minDeletions, deletions)
        }

        return minDeletions
    }
}

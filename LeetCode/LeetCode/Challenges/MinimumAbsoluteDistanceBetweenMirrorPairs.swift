// Created 05/12/2025.

import Foundation

//https://leetcode.com/problems/minimum-absolute-distance-between-mirror-pairs/
struct MinimumAbsoluteDistanceBetweenMirrorPairs {
    
    //Time: O(n * m) where n is the number of elements in `nums`
    //               where m is the number of digits in an element of `nums`
    //Space: O(n)
    //array
    //math
    //modulo
    //dictionary
    //
    //Solution Description:
    //Using a dictionary we store the mirrored values from past iterations alongside their index. This allows us to search for
    //the same value as the current iteration in O(1) time. When a match is found we determine the distance between the
    //current index and that matched/mirrored index and then compare it against `minDistance` - replacing `minDistance` if
    //needed. While there might be mutiple of the same mirrored values we only store the most recent as the other matches will
    //be further away (and so not the min distance). After each iteration we store the current mirrored value in `mapping`. Once
    //all elements in `nums` have been processed we return `minDistance`.
    func minMirrorPairDistance(_ nums: [Int]) -> Int {
        var mapping = [Int: Int]() //[mirror: index]

        var minDistance = Int.max

        for (i, num) in nums.enumerated() {
            if let mirroredIndex = mapping[num] {
                let distance = abs((mirroredIndex - i))

                minDistance = min(minDistance, distance)
            }

            let mirrored = mirror(num) //note how we save the mirror value
            mapping[mirrored] = i
        }

        return minDistance == Int.max ?  -1 : minDistance
    }

    private func mirror(_ num: Int) -> Int {
        var reversed = 0
        var remaining = num
        while remaining > 0 {
            reversed *= 10
            reversed += remaining % 10

            remaining /= 10
        }

        return reversed
    }
}

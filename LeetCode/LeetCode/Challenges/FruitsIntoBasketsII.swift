// Created 07/08/2025.

import Foundation

//https://leetcode.com/problems/fruits-into-baskets-ii/
struct FruitsIntoBasketsII {
    
    //Time: O(n * m) where n is the number of elements in `fruits`
    //               where m is the number of elements in `baskets`
    //Space: O(m)
    //array
    //visited
    //two pointers
    //nested loops
    //
    //Solution Description:
    //As the fruit element needs to be placed in the leftmost basket that is equal to or larger in size than the amount of fruit
    //we can use two pointers to iterate through both arrays to find that basket. As the arrays are unsorted we need to start
    //from zero each time we attempt to find that basket. To avoid filling the same basket twice, each time we fill a basket we
    //add it to the `used` set so that it is skipped next time. Once all fruit has been placed (or not) we calculate any
    //unplaced fruit and return that value
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        var p1 = 0
        var p2 = 0

        var used = Set<Int>()

        while p1 < fruits.count {
            var p2 = 0
            while p2 < baskets.count {
                defer { p2 += 1 }
                guard !used.contains(p2) else {
                    continue
                }

                guard baskets[p2] >= fruits[p1] else {
                    continue
                }

                used.insert(p2)

                break
            }

            p1 += 1
        }

        return fruits.count - used.count
    }
}

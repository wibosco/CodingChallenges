// Created 17/01/2026.

import Foundation

//https://leetcode.com/problems/maximum-product-of-word-lengths/
struct MaximumProductOfWordLengths {
    
    //Time: O(n * l + n ^ 2) where n is the number of elements in `words`
    //                       where l is the maximum length of an element in `words`
    //Space: O(n)
    //array
    //sets
    //nested loops
    //two pointers
    //
    //Solution Description:
    //First we iterate each element in `words` and convert each string into a character set to allow for easy searching. We
    //then iterate through each set and find those other sets where no character is shared - we then calculate the product
    //of these two distinct words. This product is then compared to `maxProduct` - if `larger` is larger, `maxProduct` is
    //replaced. We repeat this process for all elements in `words`, when all elements of `words` have been processed we
    //return `maxProduct`.
    func maxProduct(_ words: [String]) -> Int {
        var sets = Array(repeating: Set<Character>(), count: words.count)

        var p1 = 0
        while p1 < words.count {
            for c in words[p1] {
                sets[p1].insert(c)
            }

            p1 += 1
        }

        var maxProduct = 0

        var p2 = 0
        while p2 < sets.count {
            let set1 = sets[p2]

            var p3 = 0
            while p3 < sets.count {
                let set2 = sets[p3]

                if set1.isDisjoint(with: set2) {
                    //Note that we use the original elements of `words` to calculate the product to ensure duplicate
                    //characters are counted (a set removes the duplicates)
                    let product = words[p2].count * words[p3].count

                    maxProduct = max(maxProduct, product)
                }

                p3 += 1
            }

            p2 += 1
        }

        return maxProduct
    }
}

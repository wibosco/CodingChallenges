// Created 25/01/2026.

import Foundation

//https://leetcode.com/problems/minimum-ascii-delete-sum-for-two-strings/
struct MinimumASCIIDeleteSumForTwoStrings {
    
    //Time: O(n * m) where n is the number of characters in `s1`
    //               where m is the number of characters in `s2`
    //Space: O(n * m)
    //array
    //string
    //dictionary
    //graph theory
    //memoization
    //top-down
    //dynamic programming
    //DFS
    //recursive
    //two pointers
    //inout
    //
    //Solution Description:
    //We iterate through `s1` and `s2` using DFS and compare the characters from `s1` and `s2` against each other. Where the
    //characters match we simply move on as no deletion is required. Where an index of `s1` and `s2` don't match we have a
    //choice to make, we either delete from `s1` or `s2` - as we have no way of knowing which choice leads to the minimum sum
    //we need to take both paths. We repeat this until we run out of characters to compare, at which point we return the
    //deletion sum for reaching for that path. As each path returns we compare it against any alternative paths that could
    //have taken and only return the minimum deletion sum of those alternative paths. To avoid repeating work, we use
    //momoization to cache the minimum deletion sum for any given `p1` and `p2` combination. When all paths are been
    //traversed we can return the minimum deletion sum.
    func minimumDeleteSum(_ s1: String, _ s2: String) -> Int {
        var memo = [String: Int]()

        return dfs(Array(s1), Array(s2), 0, 0, &memo)
    }

    private func dfs(_ s1: [Character], _ s2: [Character], _ p1: Int, _ p2: Int, _ memo: inout [String: Int]) -> Int {
        let key = "\(p1)+\(p2)"

        guard memo[key] == nil else {
            return memo[key]!
        }

        if p1 >= s1.count && p2 >= s2.count {
            return 0
        } else if p1 >= s1.count {
            //s1 is exhausted
            let sum = Int(s2[p2].asciiValue!) + dfs(s1, s2, p1, (p2 + 1), &memo)
            memo[key] = sum

            return sum
        } else if p2 >= s2.count {
            //s2 is exhausted
            let sum = Int(s1[p1].asciiValue!) + dfs(s1, s2, (p1 + 1), p2, &memo)
            memo[key] = sum

            return sum
        }

        if s1[p1] == s2[p2] {
            let minSum = dfs(s1, s2, (p1 + 1), (p2 + 1), &memo)
            memo[key] = minSum
        } else {
            let s1SumMin = Int(s1[p1].asciiValue!) + dfs(s1, s2, (p1 + 1), p2, &memo)
            let s2SumMin = Int(s2[p2].asciiValue!) + dfs(s1, s2, p1, (p2 + 1), &memo)

            let minSum = min(s1SumMin, s2SumMin)

            memo[key] = minSum
        }

        return memo[key]!
    }
    
    //Time: O(n * m) where n is the number of characters in `s1`
    //               where m is the number of characters in `s2`
    //Space: O(n * m)
    //array
    //string
    //dictionary
    //graph theory
    //DFS
    //recursive
    //two pointers
    //inout
    //
    //Solution Description:
    //We iterate through `s1` and `s2` using DFS and compare the characters from `s1` and `s2` against each other. Where the
    //characters match we simply move on as no deletion is required. Where an index of `s1` and `s2` don't match we have a
    //choice to make, we either delete from `s1` or `s2` - as we have no way of knowing which choice leads to the minimum sum
    //we need to take both paths. We repeat this until we run out of characters to compare, at which point we return the
    //deletion sum for reaching for that path. As each path returns we compare it against any alternative paths that could
    //have taken and only return the minimum deletion sum of those alternative paths. When all paths are been traversed we
    //can return the minimum deletion sum.
    func minimumDeleteSum2(_ s1: String, _ s2: String) -> Int {
        var minSum = Int.max

        dfs2(Array(s1), Array(s2), 0, 0, 0, &minSum)

        return minSum
    }

    private func dfs2(_ s1: [Character], _ s2: [Character], _ p1: Int, _ p2: Int, _ sum: Int, _ minSum: inout Int) {
        guard p1 < s1.count, p2 < s2.count else {
            var sum = sum
            var p1 = p1
            var p2 = p2

            while p1 < s1.count {
                sum += Int(s1[p1].asciiValue!)

                p1 += 1
            }

            while p2 < s2.count {
                sum += Int(s2[p2].asciiValue!)

                p2 += 1
            }

            minSum = min(minSum, sum)

            return
        }

        if s1[p1] == s2[p2] {
            dfs2(s1, s2, (p1 + 1), (p2 + 1), sum, &minSum)
        } else {
            let s1ASCII = Int(s1[p1].asciiValue!)
            dfs2(s1, s2, (p1 + 1), p2, (sum + s1ASCII), &minSum)

            let s2ASCII = Int(s2[p2].asciiValue!)
            dfs2(s1, s2, p1, (p2 + 1), (sum + s2ASCII), &minSum)
        }
    }
}

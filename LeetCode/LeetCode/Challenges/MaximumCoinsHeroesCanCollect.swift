// Created 01/03/2024.

import Foundation

//https://leetcode.com/problems/maximum-coins-heroes-can-collect/
struct MaximumCoinsHeroesCanCollect {
    
    //Time: O(n log n + m log n) where n is the number of elements in `monsters`
    //                           where m is the number of elements in `heroes`
    //Space: O(n)
    //array
    //binary search
    //prefix sum
    //sorting
    //
    //Solution Description:
    //So we are given 3 arrays, `heroes` is independent while `monsters` and `coins` are linked. An efficent way of knowing
    //how many monsters a hero can defeat would be be sorting `monster` and using binary search to find the right most index
    //of the monster with a lower or equal power value. 
    //
    //However if we sort `monsters` how we keep the link with the values in `coins`?
    //
    //We can combine `monsters` and `coins` into one array and then sort based on the values of monster elements. From here
    //we can then create a prefix-sum array of the cost of defeating monsters as being able to defeat one monster means our
    //hero can defeat all lesser monsters as well. With these two array (sorted-and-combined-monster-coin array and
    //prefix-sum array) we can use binary to find which monsters our hero can defeat and then use the prefix-sum array to
    //determine the cost. We use binary search for all the heros and return the collected coins array.
    func maximumCoins(_ heroes: [Int], _ monsters: [Int], _ coins: [Int]) -> [Int] {
        var collectedCoins = Array(repeating: 0, count: heroes.count)
        var combinedMonsterCoins = [(Int, Int)]()
        
        for i in 0..<monsters.count {
            let monster = monsters[i]
            let coin = coins[i]
            
            combinedMonsterCoins.append((monster, coin))
        }
        
        combinedMonsterCoins.sort { $0.0 < $1.0 }
        
        var sum = 0
        var prefixSum = [Int]()
        for (_, coin) in combinedMonsterCoins {
            sum += coin
            prefixSum.append(sum)
        }
        
        for (i, hero) in heroes.enumerated() {
            let monstersDefeated = binarySearch(combinedMonsterCoins, hero)
            
            guard monstersDefeated >= 0 else {
                continue
            }
            
            collectedCoins[i] = prefixSum[monstersDefeated]
        }
        
        return collectedCoins
    }
    
    private func binarySearch(_ values: [(Int, Int)], _ target: Int) -> Int {
        var left = 0
        var right = values.count - 1
        
        var result = -1
        
        while left <= right {
            let mid = left + (right - left) / 2 //to avoid overflow
            
            if values[mid].0 <= target {
                left = mid + 1 //move rightwards
                result = mid
            } else {
                right = mid - 1 //move leftwards
            }
        }
        
        return result
    }
    
    //Time: O(
    //Space: O(
    //
    //Solution Description:
    //
    func maximumCoinsNestedLoops(_ heroes: [Int], _ monsters: [Int], _ coins: [Int]) -> [Int] {
        var collectedCoins = Array(repeating: 0, count: heroes.count)
        
        for (i, hero) in heroes.enumerated() {
            for (j, monster) in monsters.enumerated() {
                if monster <= hero {
                    collectedCoins[i] += coins[j]
                }
            }
        }
        
        return collectedCoins
    }
}

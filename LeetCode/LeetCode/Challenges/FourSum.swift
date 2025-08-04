// Created 04/08/2025.

import Foundation

//https://leetcode.com/problems/4sum/
struct FourSum {
    
    //Time: O(n log n + n^3) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //nested loops
    //two pointers
    //
    //Solution Description:
    //To reduce the nested loops we can use two outer loops to select the first two values in the quadruplet before switching
    //over to using two pointers to determine the final two values. The two pointer works by moving either the left pointer
    //`p3` rightwards if the sum of the current quadruplet is less than or equal to the target or moving the right pointer
    //`p4` leftwards if the sum of the current quadruplet is greater than. As `nums` is sorted this has the effort of
    //increasing or decreasing the sum. Once all possible combinations of the final two values have been checked we `p2`
    //loop iterates and we repeat the process. Once all `p2` elements have been checked, the `p1` loop iterates and we repeat
    //the process. Once all combinations have been checked we return `sums`.
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted(by: <)
        var sums = Set<[Int]>()
        
        var p1 = 0

        while p1 < nums.count {
            var p2 = p1 + 1
            while p2 < nums.count {
                var p3 = p2 + 1
                var p4 = nums.count - 1
                
                //two pointers
                while p3 < p4 {
                    let sum = nums[p1] + nums[p2] + nums[p3] + nums[p4]

                    if sum == target {
                        sums.insert([nums[p1], nums[p2], nums[p3], nums[p4]]) //value not indexes

                        p3 += 1
                    }

                    if sum < target {
                        p3 += 1 //too small, increase smallest element
                    } else {
                        p4 -= 1 //too big, reduce largest element
                    }
                }

                p2 += 1
            }

            p1 += 1
        }

        return Array(sums)
    }
    
    //Time: O(n log n + n^k-1) where n is the number of elements in `nums`
    //                         where k is the number of values to be found to reach `target`
    //Space: O(n)
    //array
    //DFS
    //recursion
    //
    //Solution Description:
    //Rather the solving just for 4Sum the below approach, solves for NSum. We recursively perform a loop until `k` is equal
    //to `2` before then finding the final two elements using `2Sum`.
    //
    //NB: Partially built using the same dictionary technique used in https://leetcode.com/problems/two-sum/
    func fourSum2(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted(by: <) //sorting to ensure duplicates are found
        var sums = Set<[Int]>()
        var sum = [Int]()
        
        kSum(nums, 0, target, 4, &sum, &sums)
        
        return Array(sums)
    }
    
    private func kSum(_ nums: [Int], _ left: Int, _ target: Int, _ k: Int, _ sum: inout [Int], _ sums: inout Set<[Int]>) {
        for i in left..<nums.count {
            sum.append(nums[i])
            
            if k == 3 {
                twoSum(nums, (i + 1), (target - nums[i]), sum, &sums)
            } else {
                kSum(nums, (i + 1), (target - nums[i]), (k - 1), &sum, &sums)
            }
            
            sum.removeLast()
        }
    }
    
    private func twoSum(_ nums: [Int], _ left: Int, _ target: Int, _ sum: [Int], _ sums: inout Set<[Int]>) {
        var map = [Int: Int]() //[value: index]
        
        for i in left..<nums.count {
            let diff = target - nums[i]
            if map[diff] != nil {
                sums.insert((sum + [diff, nums[i]])) //want the values not the indexes
            }
            
            map[nums[i]] = i
        }
    }
    
    //Time: O(n log n + n^4) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //nested loops
    //
    //Solution Description:
    //To generate all possible combinations of `nums`, we nest four loops.
    func fourSum3(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted(by: <)
        
        var quadruplets = Set<[Int]>()
        
        for i in 0..<nums.count {
            for j in (i + 1)..<nums.count {
                for k in (j + 1)..<nums.count {
                    for l in (k + 1)..<nums.count {
                        if nums[i] + nums[j] + nums[k] + nums[l] == target {
                            quadruplets.insert([nums[i], nums[j], nums[k], nums[l]])
                        }
                    }
                }
            }
        }
        
        return Array(quadruplets)
    }
}

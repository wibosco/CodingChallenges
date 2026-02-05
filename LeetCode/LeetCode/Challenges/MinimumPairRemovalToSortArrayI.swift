// Created 08/05/2025.

import Foundation

//https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i/
struct MinimumPairRemovalToSortArrayI {
    private class ListNode {
        var val: Int
        var next: ListNode?

        init(_ val: Int) {
            self.val = val
        }
    }
    
    //Time: O(n ^ 2) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //nexted loops
    //linked list
    //sentinel head
    //
    //Solution Description:
    //Removing elements from an array is a `O(n)` operation as it requires all the elements after the removal to shuffle forward
    //by 1 index. We can avoid this `O(n)` by converting `nums` into a linked list, then removing an element will be a `O(1)`
    //operation. So we first convert `nums` to a linked list with a sentinel head. Then we loops through the linked list until
    //we complete a loop with `isNonDescending` as true. Each loop through the linked list we track the smallest sum pair we
    //have encountered and while the linked list is in non-descending. If after looping through all elements in the linked list
    //we have discovered that the elements are not in non-descending order then we replace the value of the first element with
    //the sum of the smallest pair and skip over the second element. We then increment `operations`. Once we complete a loop of
    //the linked list with `isNonDescending` remaining true, we return `operations`.
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }

        let head = ListNode(-1)
        var tail = head

        var operations = 0

        for num in nums {
            let node = ListNode(num)

            tail.next = node
            tail = node
        }

        var isNonDescending = false

        while !isNonDescending {
            isNonDescending = true
            
            var minNode = head.next!
            var node = head.next!

            while node.next != nil {
                let n1 = node
                let n2 = node.next!

                if n1.val > n2.val {
                    isNonDescending = false
                }

                if (n1.val + n2.val) < (minNode.val + minNode.next!.val) {
                    minNode = n1
                }

                node = n2
            }

            if !isNonDescending {
                minNode.val = (minNode.val + minNode.next!.val)
                minNode.next = minNode.next?.next

                operations += 1
            }

        }

        return operations
    }
    
    //Time: O(n ^ 3) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //nested loops
    //
    //Solution Description:
    //We loop through nums until it's in non-descending order. With each iteration we find the smallest sum pair in `nums` and
    //replace that pair with a single element - the sum of the pair. With each iteration we increase `count`. Once `nums` has
    //been sorted wereturn `count`.
    func minimumPairRemoval2(_ nums: [Int]) -> Int {
        var nums = nums
        var operations = 0

        var isNonDescending = false
        while !isNonDescending, nums.count > 1 {
            isNonDescending = true

            var minPair = (0, 1)
            for i in 1..<nums.count {
                if nums[i] < nums[(i - 1)] {
                    isNonDescending = false
                }

                if (nums[(i - 1)] + nums[i]) < (nums[minPair.0] + nums[minPair.1]) {
                    minPair = ((i - 1), i)
                }
            }

            if !isNonDescending {
                nums[minPair.0] = nums[minPair.0] + nums[minPair.1]
                nums.remove(at: minPair.1)

                operations += 1
            }
        }

        return operations
    }
    
    //Time: O(n ^ 3) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //nested loops
    //
    //Solution Description:
    //We loop through nums until it's in non-descending order. With each iteration we find the smallest sum pair in `nums` and
    //replace that pair with a single element - the sum of the pair. With each iteration we increase `count`. Once `nums` has
    //been sorted wereturn `count`.
    func minimumPairRemoval3(_ nums: [Int]) -> Int {
        var nums = nums
        var count = 0
        while !isNonDecreasing(nums) {
            let pair = findMinimumSumPair(nums)
            nums[pair.0] = pair.2
            nums.remove(at: pair.1)
            
            count += 1
        }
        
        return count
    }
    
    private func findMinimumSumPair(_ nums: [Int]) -> (Int, Int, Int) {
        var minimumSumPair = (0, 1, (nums[0] + nums[1]))
        for x in 2..<nums.count {
            let currentSum = nums[x] + nums[(x - 1)]
            if currentSum < minimumSumPair.2 {
                minimumSumPair = ((x - 1), x, currentSum)
            }
        }
        
        return minimumSumPair
    }
    
    private func isNonDecreasing(_ nums: [Int]) -> Bool {
        for x in 1..<nums.count {
            if nums[x] < nums[(x - 1)] {
                return false
            }
        }
        
        return true
    }
}

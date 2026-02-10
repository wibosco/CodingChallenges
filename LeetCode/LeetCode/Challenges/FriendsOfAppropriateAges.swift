// Created 25/01/2026.

import Foundation

//https://leetcode.com/problems/friends-of-appropriate-ages/
struct FriendsOfAppropriateAges {
    
    //Time: O(n log n) where n is the number of elements in `ages`
    //Space: O(n)
    //array
    //sorting
    //binary search
    //
    //Solution Description:
    //First we sort `ages`, to allow us to use binary search to determine how many friend requests any given person can send.
    //With a sorted `ages` array we first find the lower then the upper bounds of the valid friend request group - as `ages`
    //is sorted everyone in between is valid. We calculate the number of friends by subtracting the upper bound from the
    //lower bounds and add that sum to `count`. We repeat this process for every element in `ages` and return `count`.
    func numFriendRequests(_ ages: [Int]) -> Int {
        let ages = ages.sorted()
        var count = 0
        
        var i = 0
        while i < ages.count {
            let age = ages[i]
            let minValid = age / 2 + 8  //y > 0.5 * age + 7
            
            if minValid <= age {  //valid range exists
                let left = lowerBound(ages, minValid) //first index >= minValid
                let right = upperBound(ages, age) //first index > age
                
                let range = right - left
                count += range - 1  //everyone in range except self
            }
            
            i += 1
        }
        
        return count
    }
    
    //first index where ages[index] >= target
    private func lowerBound(_ ages: [Int], _ target: Int) -> Int {
        var left = 0
        var right = ages.count
        
        while left < right {
            let mid = left + (right - left) / 2
            if ages[mid] < target { //note the <
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }
    
    //first index where ages[index] > target
    private func upperBound(_ ages: [Int], _ target: Int) -> Int {
        var left = 0
        var right = ages.count
        
        while left < right {
            let mid = left + (right - left) / 2
            if ages[mid] <= target { //note the <=
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }
    
    //Time: O(n log n) where n is the number of elements in `ages`
    //Space: O(n)
    //array
    //sorting
    //binary search
    //
    //Solution Description:
    //By sorting `ages` in descending order we can apply binary search to find the right-most element of `ages` that the
    //current element of `ages` can find a friend request to. With that right-most element we know that all elements between
    //the current `ages` element and that right-most element are also valid we can add the difference between the indexes of
    //to `count`. Special care has to be taken for duplicates in `ages` as these can result in two friend requests being
    //made but a straight forward binary search won't account for this so before engaging in a binary search we need to
    //reach the end of that duplicated sequence and add those friend requests to `count`, we also need to account for the
    //duplicates after the binary search as each duplicate can send the same friend requests. Once we check all elements
    //in `ages` we can return `count`.
    func numFriendRequests2(_ ages: [Int]) -> Int {
        var count = 0
        let ages = ages.sorted { $0 > $1 }

        var i = 0
        while i < ages.count {
            //skip over duplicates
            var sameAgeCount = 1
            while (i + 1) < ages.count && ages[i] == ages[(i + 1)] && canSendFriendRequest(ages[i], ages[(i + 1)]) {
                sameAgeCount += 1
                i += 1
            }

            if sameAgeCount > 1 {
                count += (sameAgeCount * (sameAgeCount - 1))
            }

            var left = i + 1
            var right = ages.count - 1

            while left <= right {
                let mid = left + (right - left) / 2

                if canSendFriendRequest(ages[i], ages[mid]) {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }

            let requestsSent = right - i
            //as we move `i` when we encounter duplicates, without `* sameAgeCount` we'd only be counting the last duplicate
            //sending of a friend request but all of them would be able to send that same friend request
            count += requestsSent * sameAgeCount

            i += 1
        }

        return count
    }

    private func canSendFriendRequest(_ x: Int, _ y: Int) -> Bool {
        if Double(y) <= (0.5 * Double(x) + 7) {
            return false
        }

        if y > x {
            return false
        }

        if y > 100 && x < 100 {
            return false
        }

        return true
    }
}

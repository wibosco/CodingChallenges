//
//  MergeKSortedLists.swift
//  LeetCode
//
//  Created by William Boles on 08/04/2022.
//

import Foundation

//https://leetcode.com/problems/merge-k-sorted-lists/
//linked list
struct MergeKSortedLists {
    
    //Time: O(n log k) where n is the total number of nodes in `lists`, k is the number of elements in `lists`
    //Space: O(n log k) where k is the number of elements in `lists`, n is the total number of nodes in `lists`
    //array
    //recursive
    //merge sort
    //sentinel head
    //divide and conquer
    //
    //Solution Description:
    //Using merge sort we divide the elements in `lists` into pairs and merge each pair. To merge each pair we iterate through
    //both `list1` and `list2` choosing the smaller node from each list to add to the merged list as the new `tail`. To keep
    //access to the head of the merged list we employ a sentinel head node. We continue this until one list is exhausted and
    //then add the remaining of the other to merged list. We repeat this process for pairs in `lists`. With our reduced `lists`
    //we then recursively call `mergeKLists` passing the reduced `lists` to repeat the whole process. We only stop merging
    //once we get down to just the one element in `list`.
    static func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        
        guard lists.count > 1 else {
            return lists[0]
        }
        
        var mergedLists = [ListNode?]()
        var i = 0
        
        while i < lists.count {
            if (i + 1) < lists.count {
                let mergedList = mergeLists(lists[i], lists[(i + 1)])
                mergedLists.append(mergedList)
            } else {
                mergedLists.append(lists[i])
            }

            i += 2
        }
        
        return mergeKLists(mergedLists)
    }
    
    private static func mergeLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1, let list2 = list2 else {
            return list1 == nil ? list2: list1
        }
        
        let sentinel = ListNode(-1)
        var tail = sentinel
        
        var p1: ListNode? = list1
        var p2: ListNode? = list2
        
        while let l1 = p1, let l2 = p2 { //only loop until you exhaust one of the lists
            if l1.val < l2.val {
                tail.next = p1
            
                p1 = p1?.next
            } else {
                tail.next = p2
                
                p2 = p2?.next
            }
            
            tail = tail.next! //move the tail of merged
        }
        
        tail.next = p1 == nil ? p2 : p1 //add the remaining nodes as is to the merged list
    
        return sentinel.next
    }
    
    //Time: O(k * max(a, b)) where k is the number of elements in `lists`, a is the size of `mergedList`, b is the size of
    //                       the current element of `lists`
    //Space: O(n) where n is the total number of nodes in `lists`
    //array
    //sentinel head
    //
    //Solution Description:
    //Using the first element in `lists` as our merged linked list, we iterate through each other element in `lists` and
    //merge that subsequent list into `mergedList` - gradually building it up as we go. To merge each list we iterate through
    //both `list1` and `list2` choosing the smaller node from each list to add to the merged list as the new `tail`. To keep
    //access to the head of the merged list we employ a sentinel head node. We continue this until one list is exhausted and
    //then add the remaining of the other to merged list.
    static func mergeKListsOneByOne(_ lists: [ListNode?]) -> ListNode? {
        guard !lists.isEmpty else {
            return nil
        }
        
        var mergedList = lists[0]
        
        for list in lists[1...] {
            mergedList = mergeLists(mergedList, list) //uses same merge method as above solution
        }
        
        return mergedList
    }
}

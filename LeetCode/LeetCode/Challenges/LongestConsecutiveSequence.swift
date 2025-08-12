//
//  LongestConsecutiveSequence.swift
//  LeetCode
//
//  Created by William Boles on 10/04/2023.
//

import Foundation

//https://leetcode.com/problems/longest-consecutive-sequence/
struct LongestConsecutiveSequence {
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //set
    //
    //Solution Description:
    //Rather than sorting `nums` which would be a O(n log n) operation we can instead iterate twice through the elements in
    //`nums` to determine the longest sequence. On the first iteration we build up the `elements` set which will allows us to
    //check if a `nums` element has a pre or post sequence value in O(1) time. In the next iteration of `elements` as we only
    //need the unique values of `nums`, we first check if `num - 1` exists in `elements` - the start of a sequence is the
    //left/lowest value in that sequence so has. If `num - 1` exists then we know that we don't have the start of a sequence
    //and that a longer sequence could be formed so we move to the next element in `elements`; if `num - 1` doesn't not exist
    //we have found the start of a sequence now need to find the end, as we are looking for a consecutive sequence we know
    //the next value needs to be `num + 1` so we search for that value. We repeat this incrementing and search process until
    //the next value in the sequence doesn't exist. Once the length of a sequence is found we compare it against `longest`
    //and take the higher value. When all elements have been processed we return `longest`.
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }

        var elements = Set<Int>()
        for num in nums {
            elements.insert(num)
        }

        var longest = 1
        for num in elements { //no need to search through `nums` again, only need the unique values
            guard !elements.contains((num - 1)) else {
                //num isn't the start of a sequence
                continue
            }

            //num is the start of a sequence
            var length = 1
            var next = num + 1
            while elements.contains(next) {
                length += 1
                next += 1
            }

            longest = max(longest, length)
        }

        return longest
    }
    
    //Time: O(n) where n is the number of elements in `nums`
    //Space: O(n)
    //array
    //graph theory
    //adjacency list
    //dictionary
    //DFS
    //recursive
    //visited
    //multi-source
    //subgraphs
    //undirected graph
    //
    //Solution Description:
    //Treating `nums` as a graph we can build an adjacency list connecting those elements that are either 1 less or 1 greater
    //in value. Once that adjacency list is built we can then use DFS to search through each subgraph, exploring all nodes in
    //that graph and return their count. To avoid re-searching the same grpah from different starting nodes we use a
    //`visited` set - if a node is found in the set the search ia aborted. Once each subgraph has been search we return
    //`longest`.
    func longestConsecutive2(_ nums: [Int]) -> Int {
        var adjList = [Int: [Int]]()

        for num in nums {
            guard adjList[num] == nil else {
                continue
            }

            adjList[num] = [Int]()
            if adjList[(num - 1)] != nil {
                adjList[(num - 1)]?.append(num)
                adjList[num]?.append((num - 1))
            }

            if adjList[(num + 1)] != nil {
                adjList[(num + 1)]?.append(num)
                adjList[num]?.append((num + 1))
            }
        }

        var longest = 0
        var visited = Set<Int>()
        for (key, _) in adjList {
            let length = dfs(adjList, key, &visited)
            longest = max(longest, length)
        }

        return longest
    }

    private func dfs(_ adjList: [Int: [Int]], _ key: Int, _ visited: inout Set<Int>) -> Int {
        guard !visited.contains(key) else {
            return 0
        }
        visited.insert(key)
        
        var length = 0
        for neighbor in (adjList[key] ?? []) {
            length += dfs(adjList, neighbor, &visited)
        }

        return length + 1
    }
}

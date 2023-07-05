//
//  PartitionLabels.swift
//  LeetCode
//
//  Created by William Boles on 05/07/2023.
//

import Foundation

//https://leetcode.com/problems/partition-labels/
//string
struct PartitionLabels {
    
    //Time: O(n) where n is the number of characters in `s`
    //Space: O(n) where n is the `characters` array
    //dictionary
    //array
    //
    //
    //Solution Description:
    //Each partition is set by overlapping character pairs so that if any character falls between character pairs, that character
    //becomes part of that partition. The really interesting part is that a partition can grow if a starting character that falls
    //inside a character pair ends outside of that initial pair so expanding that partition i.e. a character pair while at the
    //start of partition needs to be the same character subsequent iteration can change the right/end character to different
    //character. With this in mind, we first build a dictionary that holds the end/right-most index of each character - this will
    //allow for O(1) retrieval when determining the end/right-most boundary of a partition. Next we iterate through each
    //character in `s` to determine if that character falls inside the existing partition or is the start of a new partition. As
    //each partition ends we determine it's length and add it to `lengths`.
    static func partitionLabels(_ s: String) -> [Int] {
        var characterEndIndexes = [Character: Int]()
        let characters = Array(s)
        
        for (i, c) in characters.enumerated() {
            characterEndIndexes[c] = i
        }
        
        var lengths = [Int]()
        var partitionStartIndex = 0
        var partitionEndIndex = 0
        
        for (i, c) in characters.enumerated() {
            let endIndex = characterEndIndexes[c]!
            
            if i <= partitionEndIndex {
                //check if `c` extends the partition
                partitionEndIndex = max(endIndex, partitionEndIndex)
            } else {
                //end old partition
                let length = (partitionEndIndex - partitionStartIndex) + 1
                lengths.append(length)
                
                //start new partition
                partitionStartIndex = i
                partitionEndIndex = endIndex
            }
        }
        //end last partition
        let length = (partitionEndIndex - partitionStartIndex) + 1
        lengths.append(length)
        
        return lengths
    }
    
    //Time: O(n log n) where n is the number of characters in `s`
    //Space: O(n)
    //dictionary
    //array
    //
    //Solution Description:
    //Each partition is set by overlapping character pairs so that if any character falls between character pairs, that character
    //becomes part of that partition. The really interesting part is that a partition can grow if a starting character that falls
    //inside a character pair ends outside of that initial pair so expanding that partition i.e. a character pair while at the
    //start of partition needs to be the same character subsequent iteration can change the right/end character to different
    //character. With this in mind, we first build a dictionary that holds the start/left-most and end/right-most index of each
    //character. We then sort these ranges by starting position so that when attempting to merge them we only need to move
    //forward so can merge all ranges in one pass. To determine if a range overlaps we compare the start/left-most index of the
    //current partition against the last already merged partition. If that start/left-most index is before the partitions
    //end/right-most index then we merge the partitions, taking care to extend the new partition end/right-most index if needed;
    //else if the start/left-most index is before the partitions end/right-most index we create a new partition. Once all
    //partitions have been merged we determine the length of each partition.
    static func partitionLabelsA(_ s: String) -> [Int] {
        var startEnd = [Character: (Int, Int)]() //[letter: (start, end)]
        
        let characters = Array(s)
        for (i, c) in characters.enumerated() {
            if let existing = startEnd[c] {
                startEnd[c] = (existing.0, i)
            } else {
                startEnd[c] = (i, i)
            }
        }
        
        let partitions = startEnd.values.sorted { $0.0 < $1.0 }
        var mergedPartitions = [partitions.first!]
        
        for partition in partitions[1...] {
            let mergedPartition = mergedPartitions.last!
                
            if partition.0 <= mergedPartition.1 {
                let end = max(mergedPartition.1, partition.1)
                mergedPartitions[(mergedPartitions.count - 1)] = (mergedPartition.0, end)
            } else {
                mergedPartitions.append(partition)
            }
        }
        
        var lengths = [Int]()
        
        for partition in mergedPartitions {
            let length = (partition.1 - partition.0) + 1
            lengths.append(length)
        }
        
        return lengths
    }
}

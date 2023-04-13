//
//  ShortestWordDistanceII.swift
//  LeetCode
//
//  Created by William Boles on 30/03/2022.
//

import Foundation

//https://leetcode.com/problems/shortest-word-distance-ii/
//design
//array
//
//Time: O(n) where n is number of words in `wordsDict`
//Space: O(n)
//
//Solution Description:
//As the same word can appear multiple times in `wordsDict` we convert `wordsDict` into a dictionary with the word being the
//key and the index(es) of that word being the value. In `shortest` we find the indexes of `word1` and `word2` and attempt to
//find the shortest distance between the available indexes. As the indexes will be sorted we can use this property to avoid
//nested loops instead as we are attempting to find the shortest distance we can increment the lesser of the two indexes (`p1`
//or `p2`) to potentally shorten the current distance and save on iterations.
final class ShortestWordDistanceII {
    private var words = [String: [Int]]()

    //Time: O(n) where n is the number of elements in `wordsDict`
    init(_ wordsDict: [String]) {
        for i in 0..<wordsDict.count {
            let word = wordsDict[i]
            words[word, default: [Int]()].append(i)
        }
    }
    
    //Time: O(max(k or l)) where k is the elements in `word1Indexes`, l is the elements in `word2Indexes`
    func shortest(_ word1: String, _ word2: String) -> Int {
        let word1Indexes = words[word1]!
        let word2Indexes = words[word2]!
        
        var p1 = 0
        var p2 = 0
        var shortestDistance = Int.max
        
        while p1 < word1Indexes.count && p2 < word2Indexes.count {
            let word1Index = word1Indexes[p1]
            let word2Index = word2Indexes[p2]
            
            let distance = abs((word1Index - word2Index))
            shortestDistance = min(shortestDistance, distance)
            
            if word1Index > word2Index {
                //as word1Index is greater than word2Index, incrementing p1 (word1Index) would only increase the distance
                //between the next word1Index and word2Index instead we can potentally narrow it by incrementing p2
                p2 += 1
            } else {
                //as word2Index is greater than or equal to word1Index, incrementing p2 (word2Index) would only increase
                //the distance between the next word1Index and word2Index instead we can potentally narrow it by
                //incrementing p1
                p1 += 1
            }
        }
    
        return shortestDistance
    }
}

//
//  HandOfStraights.swift
//  LeetCode
//
//  Created by William Boles on 04/07/2023.
//

import Foundation

//https://leetcode.com/problems/hand-of-straights/
struct HandOfStraights {
    
    //Time: O(n log n) where n is the number of elements in `hand`
    //Space: O(n)
    //array
    //dictionary
    //sorting
    //greedy
    //modulo
    //
    //Solution Description:
    //A straight hand is a card group that has consecutive cards e.g. 1->2->3, where each value needs to be unique. To determine
    //if `hand` can be split into a `groupSize` straight, each group needs to hold the same number of cards so first we check that
    //the `hand` count can be split into `groupSize` size groups using the modulo operation. To improve retrieval performance we
    //then organise `hand` into a frequency dictionary with the card value as the key and the count as the value. We then sort
    //these unique keys into ascending order. As we want to split all cards into evenly sized groups, we know exactly how many
    //groups we want so we know our first outer loop. Next we loop through the unique cards we haven't already placed in a group
    //and check that each card would form a consecutive group i.e. +1 in value to the previous card. If the card has a greater
    //value than +1 we can't form a consecutive group and so we return false; else we continue until we have a full group or we
    //run out of cards. When we exit the group we check if the last group we attempted to build formed a full group - if not we
    //return false. We repeat this process until all cards are placed in groups.
    static func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        guard hand.count % groupSize == 0 else {
            return false
        }
        
        var cardFrequency = [Int: Int]()
        
        for card in hand {
            cardFrequency[card, default: 0] += 1
        }
        
        let sortedKeys = cardFrequency.keys.sorted { $0 < $1 }
        
        let groupingCount = hand.count / groupSize
        
        for _ in 0..<groupingCount {
            var lastCard: Int?
            var handCount = groupSize
            
            for card in sortedKeys where cardFrequency[card] != 0 && handCount > 0 {
                let cardCount = cardFrequency[card]!
                if let lastCard = lastCard {
                    if card - lastCard > 1 { //check if next card is consecutive
                        return false
                    }
                }
                
                cardFrequency[card] = cardCount - 1
                lastCard = card
                handCount -= 1
            }
            
            if handCount > 0 {
                return false
            }
        }
        
        return true
    }
}

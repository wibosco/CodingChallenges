//
//  ACMICPCTeam.swift
//  CodingChallenges
//
//  Created by William Boles on 11/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import Foundation

//https://www.hackerrank.com/challenges/acm-icpc-team
class ACMICPCTeam {

    static func bestCombination(contestantsTopicKnowledge: [String]) -> (maximumTopicsKnown: Int, teamsThatCanAchieveThis: Int) {
        var maximum = Int(contestantsTopicKnowledge[0], radix: 2)!
        var teamsKnowledgeScore = [Int]()
        
        for i in 0..<contestantsTopicKnowledge.count {
            let firstContestantTopicKnowledge = contestantsTopicKnowledge[i]
            
            for j in (i+1)..<contestantsTopicKnowledge.count {
                let secondContestantTopicKnowledge = contestantsTopicKnowledge[j]
                let bitWiseOrResult = Int(firstContestantTopicKnowledge, radix: 2)! | Int(secondContestantTopicKnowledge, radix: 2)!

                if bitWiseOrResult > maximum {
                    maximum = bitWiseOrResult
                }
                
                teamsKnowledgeScore.append(bitWiseOrResult)
            }
        }
        
        var teamsWithMaximumScore = 0
        
        teamsKnowledgeScore.forEach { (knowledgeScore) in
            if knowledgeScore == maximum {
                teamsWithMaximumScore += 1
            }
        }
        
        var maximumTopics = 0
        let binaryMaximum = String(maximum, radix: 2)
        
        for ch in binaryMaximum {
            if ch == Character("1") {
                maximumTopics += 1
            }
        }
        
        
        return (maximumTopics, teamsWithMaximumScore)
    }
    
     static func bestCombinationAlt(contestantsTopicKnowledge: [String]) -> (maximumTopicsKnown: Int, teamsThatCanAchieveThis: Int) {
        var maximum = 0
        var teamsKnowledgeScore = [Int]()
        
         for i in 0..<contestantsTopicKnowledge.count {
            let firstContestantTopicKnowledge = contestantsTopicKnowledge[i]
            
            for j in (i+1)..<contestantsTopicKnowledge.count {
                let secondContestantTopicKnowledge = contestantsTopicKnowledge[j]
                
                if secondContestantTopicKnowledge != firstContestantTopicKnowledge {
                    var uniqueTopicsForContestantCombination = 0
                    var numberOfUnknownTopics = 0
                    
                    for characterIndex in secondContestantTopicKnowledge.indices {
                        let topicKnowledgeA = Int(String(firstContestantTopicKnowledge[characterIndex]))!
                        let topicKnowledgeB = Int(String(secondContestantTopicKnowledge[characterIndex]))!
                        
                        if topicKnowledgeA | topicKnowledgeB == 1 {
                            uniqueTopicsForContestantCombination += 1
                            
                            continue
                        } else {
                            numberOfUnknownTopics += 1
                        }
                        
                        if maximum > (secondContestantTopicKnowledge.count - numberOfUnknownTopics) {
                            break
                        }
                    }
                    
                    if uniqueTopicsForContestantCombination > maximum {
                        maximum = uniqueTopicsForContestantCombination
                    }
                    
                    teamsKnowledgeScore.append(uniqueTopicsForContestantCombination)
                }
            }
        }
        
        var teamsWithMaximumScore = 0
        
        teamsKnowledgeScore.forEach { (knowledgeScore) in
            if knowledgeScore == maximum {
                teamsWithMaximumScore += 1
            }
        }
        
        return (maximum, teamsWithMaximumScore)
    }
}

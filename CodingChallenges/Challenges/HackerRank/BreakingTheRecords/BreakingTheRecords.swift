//
//  BreakingTheRecords.swift
//  CodingChallenges
//
//  Created by William Boles on 28/10/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

struct BreakingTheRecords {
    static func breakingRecords(scores: [Int]) -> (max: Int, min: Int) {
        class ScoreUpdateCount {
            private(set) var score = 0
            private(set) var count = 0
            
            init(score: Int) {
                self.score = score
            }
            
            func updateScore(_ newScore: Int) {
                score = newScore
                count += 1
            }
        }
        
        let min = ScoreUpdateCount(score: scores[0])
        let max = ScoreUpdateCount(score: scores[0])

        for score in scores.suffix(from: 1) {
            if min.score > score {
                min.updateScore(score)
            } else if score > max.score {
                max.updateScore(score)
            }
        }
        
        return (max.count, min.count)
    }
}

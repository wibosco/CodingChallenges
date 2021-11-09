//
//  AllWrong.swift
//  CodingChallenges
//
//  Created by William Boles on 09/11/2021.
//  Copyright © 2021 Boles. All rights reserved.
//

import Foundation

struct AllWrong {
    static func wrongAnswers(n: Int, c: String) -> String {
        var allWrong = ""
        for answer in c {
            let wrong = answer == "A" ? "B" : "A"
            allWrong += wrong
        }
        
        return allWrong
    }
}

// Created 17/11/2021.

import Foundation

struct GuessNumberHigherOrLower {
    let picked: Int
    
    // MARK: - Guess
    
    private func guess(_ num: Int) -> Int {
        if picked == num {
            return 0
        } else if picked > num {
            return 1
        }
        
        return -1
    }
    
    func guessNumber(_ n: Int) -> Int {
        var left = 0
        var right = n
        
        while left <= right {
            let mid = left + (right - left) / 2
            let outcome = guess(mid)
            if outcome == 0 {
                return mid
            } else if outcome == -1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
}

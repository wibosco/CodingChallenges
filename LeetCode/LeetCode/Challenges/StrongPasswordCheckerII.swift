// Created 05/12/2025.

import Foundation

//https://leetcode.com/problems/strong-password-checker-ii/
struct StrongPasswordCheckerII {
    
    //Time:
    //Space:
    //
    //
    //Solution Description:
    //
    func strongPasswordCheckerII(_ password: String) -> Bool {
        guard password.count >= 8 else {
            return false
        }

        let specialCharacters = Set<Character>(["!", "@", "#", "$", "%", "^", "&", "*", "(",")", "-", "+"])

        var lowercase = false
        var uppercase = false
        var digit = false
        var special = false

        var prev: Character? = nil

        let password = Array(password)
        for c in password {
            if let prev, c == prev  {
                return false
            }

            if c.isLetter {
                if c.isLowercase {
                    lowercase = true
                } else {
                    uppercase = true
                }
            } else if c.isNumber {
                digit = true
            } else if specialCharacters.contains(c) {
                special = true
            } else {
                return false
            }

            prev = c
        }

        return lowercase &&
                uppercase &&
                digit &&
                special
    }
}

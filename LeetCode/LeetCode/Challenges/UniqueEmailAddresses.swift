//
//  UniqueEmailAddresses.swift
//  LeetCode
//
//  Created by William Boles on 07/07/2023.
//

import Foundation

//https://leetcode.com/problems/unique-email-addresses/
struct UniqueEmailAddresses {
    
    //Time: O(n * m) where n is the elements in `emails`
    //               where m is the number of characters in each email
    //Space: O(n)
    //array
    //nested loops
    //set
    //
    //Solution Description:
    //Iterating through each email we prune out the undesired characters `.` and `+` from before the `@`. With `.` characters
    //we simply remove them from the string and with `+` we remove them and all characters that follow until we get to an `@`
    //To do this we first split the email around the `@` and then prune the local section. If we encounter a `.` we skip it
    //and if we encounter a `+` we break the loop, for any other characters we add it to `pruneLocal`. Once we iterate
    //through all characters in the email address (removing those characters we don't want) we add the sanitised email to a
    //set so that any duplicate entries are automatically merged/removed. Once all emails are parsed we return the count of
    //that set.
    func numUniqueEmails(_ emails: [String]) -> Int {
        var uniqueEmails = Set<String>()
        
        for email in emails {
            let elements = email.split(separator: "@")
            let local = Array(elements[0])
            let domain = elements[1]
            
            var prunedLocal = [Character]()
            for c in local {
                if c == "+" {
                    break
                }
                
                if c == "." {
                    continue
                }
                
                prunedLocal.append(c)
            }
            
            let prunedEmail = "\(String(prunedLocal))@\(domain)"
            uniqueEmails.insert(prunedEmail)
        }
        
        return uniqueEmails.count
    }
    
    //Time: O(n * m) where n is the elements in `emails`
    //               where m is the number of characters in each email
    //Space: O(n)
    //array
    //nested loops
    //set
    //
    //Solution Description:
    //Iterating through each email we prune out the undesired characters `.` and `+` from before the `@`. With `.` characters
    //we simply remove them from the string and with `+` we remove them and all characters that follow until we get to an `@`
    //To control this we have two local variable `prune` and `ignore` - `prune` controls whether we care about the characters
    //in this section of the email address, `ignore` controls whether we skip the current character. Once we iterate through
    //all characters in the email address (removing those characters we don't want) we add the sanitised email to a set so
    //that any duplicate entries are automatically merged/removed. Once all emails are parsed we return the count of that set.
    func numUniqueEmailsCharacter(_ emails: [String]) -> Int {
        var uniqueEmails = Set<String>()
        
        for email in emails {
            let characters = Array(email)
            
            var prune = true
            var ignore = false
            
            var prunedEmail = [Character]()
            for c in characters {
                if c == "@" {
                    prune = false
                    ignore = false
                }
                
                if ignore {
                    continue
                }
                
                if (c == "+") && prune {
                    ignore = true
                    continue
                }
                
                if (c == ".") && prune {
                    continue
                }
                
                prunedEmail.append(c)
            }
            
            uniqueEmails.insert(String(prunedEmail))
        }
        
        return uniqueEmails.count
    }
}

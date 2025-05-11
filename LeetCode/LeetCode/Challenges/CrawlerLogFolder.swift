// Created 11/05/2025.

import Foundation

//https://leetcode.com/problems/crawler-log-folder/
struct CrawlerLogFolder {
    
    //Time: O(n) where n is the number of elements in `logs`
    //Space: O(1)
    //array
    //
    //Solution Description:
    //Assigning a value to each log type we can determine how many operations are required to get to `main` by adding those
    //values. So `./` becomes 0, `../` becomes -1, and `x/` becomes +1. We can then keep a running count based on the
    //operations seen in `logs`. When all logs have been processed we can return `count`.
    func minOperations(_ logs: [String]) -> Int {
        var count = 0

        for log in logs {
            guard log != "./" else {
                continue
            }

            if log == "../" {
                count = max(0, (count - 1)) //if we are already at `main` i.e. count == 0, we can go beyond.
            } else {
                count += 1
            }
        }

        return count
    }
    
    //Time: O(n) where n is the number of elements in `logs`
    //Space: O(n)
    //array
    //stack
    //
    //Solution Description:
    //Using a stack we can track which folder the user is in. `./` is a no-op, `../` pops an elements, and `x/` pushes an
    //element. When all logs have been processed we can return the count of the stack.
    func minOperations2(_ logs: [String]) -> Int {
        var stack = [String]()
        
        for log in logs {
            guard log != "./" else {
                continue
            }

            if log == "../" {
                _ = stack.popLast()
            } else {
                stack.append(log)
            }
        }
        
        return stack.count
    }
}

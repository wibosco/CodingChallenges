// Created 01/03/2022.

import Foundation

//https://leetcode.com/problems/exclusive-time-of-functions/
struct ExclusiveTimeOfFunctions {
    
    //Time: O(n) where n is the number of elements in `logs`
    //Space: O(n)
    //stack
    //array
    //
    //Solution Description:
    //A functions execution can be split by multiple functions inbetween so calculating the execution time isn't as simple as
    //substracting the start time from the end time as those unbetween functions effectively "pause" the current function.
    //Using a stack we can store the start logs in the order they appear. Once we encounter an end log we pop the top log from
    //`stack` (this will be in the starting log of the end log) as calculate the difference between the two timestamps before
    //adding to the value in `times`. It's important to note that the value in `time` might not be 0 because as we the process
    //the current end log we also adjust the time value of the wrapping function to remove the time that the wrapped function
    //was "paused". Once all logs have been processed we return `times`.
    func exclusiveTime(_ n: Int, _ logs: [String]) -> [Int] {
        var times = Array(repeating: 0, count: n)
        var stack = [(Int, Int)]() //(fid, timestamp)
        
        for log in logs {
            let components = log.components(separatedBy: ":")
            let fid = Int(components[0])!
            let type = components[1]
            let timestamp = Int(components[2])!

            if type == "start" {
                stack.append((fid, timestamp))
            } else {
                //last element in `stack` is should be the start log of the current log
                let (_, startTimestamp) = stack.removeLast()
                let executionTime = (startTimestamp...timestamp).count
                times[fid] += executionTime

                if let (wrappingFid, _) = stack.last {
                    //adjust time excuting of function that wrapped the current one
                    times[wrappingFid] -= executionTime
                }
            }
        }

        return times
    }
    
    //Time: O(n) where n is the number of elements in `logs`
    //Space: O(n) where n is the number of elements in `logs` (actually O(n/2))
    //array
    //stack
    //
    //Solution Description:
    //In order to calculate how long a process has been running we to stitch together all the times that process has had sole
    //use of the CPU. There are two scenarios where a process isn't running:
    //
    //1. It has been paused (because another process is now running)
    //2. It has been ended
    //
    //For both these scenarios we need to calculate the difference between the previous timestamp and current timestamp to
    //determine that run time. So we are effectively using the present/current process to determine the runtime of the previous
    //process. As a process can be paused and/or have multiple instances we can stitch it's running time together adding to a
    //running total associated with that process - `times`, with the process ID being the index. We can use a stack to hold any
    //running/paused processes. When a new process starts we peek at the previous process on the stack to update that previous
    //processes running time value. When a process ends we pop from the stack to and update that ended processes running time
    //value. Please note that every start has a end so we don't need to handle any cases around non-ended processes. Also the
    //start and end logs are balanced i.e. start and ends happen in sequence - could have `A-start, B-start, B-end, A-end` but
    //not `A-start, B-start, A-end, B-end` so if we get an end log then the top of the stack should be its corresponding start
    //log
    //
    //NB. Really important to spot that when a process ends it takes the full second to end so actually it ends on the next
    //second
    func exclusiveTime2(_ n: Int, _ logs: [String]) -> [Int] {
        var stack = [Log]()
        var times = Array(repeating: 0, count: n)
        
        var time = 0 //timestamp of last work - start or end
        
        for i in 0..<logs.count {
            let currentLog = parse(logs[i])
            
            switch currentLog.type {
            case .start:
                if let previousLog = stack.last {
                    let timeElapsed = currentLog.timestamp - time
                    times[previousLog.functionID] += timeElapsed
                }
                stack.append(currentLog)
            case .end:
                //every start has an end so last element in the stack should be the start log of this current end log
                let previousLog = stack.removeLast()
                let timeElapsed = currentLog.timestamp - time
                times[previousLog.functionID] += timeElapsed // could be `currentLog` as the logs are balanced
            }

            time = currentLog.timestamp
        }
        
        return times
    }
        
    private struct Log {
        // swiftlint:disable nesting
        enum LogType {
            case start
            case end
        }
        // swiftlint:enable nesting
        
        let functionID: Int
        let type: LogType
        let timestamp: Int
    }
    
    private func parse(_ log: String) -> Log {
        let components = log.split(separator: ":")
        
        let functionID = Int(components[0])!
        let type = components[1] == "start" ? Log.LogType.start : Log.LogType.end
        //when a process ends it does at the end of the timestamp i.e. the start of the next second
        //when a process starts it does so at the start of the timestamp i.e. the start of the current second
        //so we need to offset on end but not start
        let timestampOffset = type == .end ? 1 : 0
        let timestamp =  Int(components[2])! + timestampOffset
        
        let log = Log(functionID: functionID, type: type, timestamp: timestamp)
        
        return log
    }
}

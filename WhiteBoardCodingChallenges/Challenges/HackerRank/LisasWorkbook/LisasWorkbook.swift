//
//  LisasWorkbook.swift
//  WhiteBoardCodingChallenges
//
//  Created by William Boles on 09/05/2016.
//  Copyright © 2016 Boles. All rights reserved.
//

import UIKit

//https://www.hackerrank.com/challenges/bear-and-workbook
class LisasWorkbook: NSObject {

    class func specialProblemsInBook(problemsPerChapter: [Int], problemsPerPage: Int) -> Int {
        
        var specialProblems = 0
        var pageNumber = 1
        
        for problemsInChapter in problemsPerChapter {
            
            for problem in 1...problemsInChapter {
                
                if problem == pageNumber {
                    
                    specialProblems += 1
                }
                
                if problem % problemsPerPage == 0 {
                    
                    pageNumber += 1
                }
            }
            
            //Check if the chapter has a partial page - if so we need to add one more to the count value
            if  problemsInChapter % problemsPerPage != 0 {
                
                pageNumber += 1
            }
        }
        
        return specialProblems
    }
    
    class func specialProblemsInBookAlt(problemsPerChapter: [Int], problemsPerPage: Int) -> Int {
        
        var specialProblems = 0
        var pageNumber = 1
        
        for problemsInChapter in problemsPerChapter {
            
            let pagesInChapter = Int(ceil(Double(problemsInChapter)/Double(problemsPerPage)))
            
            if problemsInChapter >= ((pageNumber + pagesInChapter) - 1) {
                
                var startProblemIndex = 1
                
                while startProblemIndex <= problemsInChapter {
                 
                    if pageNumber >= startProblemIndex && pageNumber < (startProblemIndex + problemsPerPage) {
                        
                        specialProblems += 1
                    }
                    
                    startProblemIndex += problemsPerPage
                    pageNumber += 1
                }
            }
            else {
                
                pageNumber += pagesInChapter
            }
        }
        
        return specialProblems
    }

}

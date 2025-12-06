// Created 27/10/2021.

import Foundation

//https://www.hackerrank.com/challenges/grading/problem
struct GradingStudents {
    
    static func roundGrades(_ grades: [Int]) -> [Int] {
        guard !grades.isEmpty else {
            return [Int]()
        }
        
        return grades.map { grade in
            guard grade >= 38 else {
                return grade
            }
            
            let roundedGrade = Int(roundUpToNearest5(Double(grade)))
            return roundedGrade - grade > 2 ? grade: roundedGrade
        }
    }
}

func round<T>(_ value: T, toNearest to: T, roundingRule: FloatingPointRoundingRule) -> T where T: FloatingPoint {
    (value / to).rounded(roundingRule) * to
}

func roundUpToNearest5<T>(_ value: T) -> T where T: FloatingPoint {
    round(value, toNearest: 5, roundingRule: .up)
}

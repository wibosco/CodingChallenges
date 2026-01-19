// Created 17/01/2026.

import Foundation

//https://leetcode.com/problems/maximum-students-on-a-single-bench/
struct MaximumStudentsOnASingleBench {
    
    //Time: O(n) where n is the number of elements in `students`
    //Space: O(n)
    //array
    //set
    //dictionary
    //
    //Solution Description:
    //Using a dictionary we calculate how many students are sitting at each bench. As the student can appear in `students` we
    //store the students at each bench in a set to automatically remove any duplicates. To avoid having to search `dict` to
    //determine the bench with the most students, we track the ongoing max students with `maxStudentsOnBench`. After a student
    //is added to a bench we compare the updated bench against `maxStudentsOnBench`, replacing `maxStudentsOnBench` if needed.
    //Once all students have been added to a bench we return `maxStudentsOnBench`.
    func maxStudentsOnBench(_ students: [[Int]]) -> Int {
        var dict = [Int: Set<Int>]() //[bench_id: [student_id]]
        var maxStudentsOnBench = 0

        for element in students {
            let studentId = element[0]
            let benchId = element[1]

            dict[benchId, default: Set<Int>()].insert(studentId)

            maxStudentsOnBench = max(maxStudentsOnBench, dict[benchId]!.count)
        }

        return maxStudentsOnBench
    }
}

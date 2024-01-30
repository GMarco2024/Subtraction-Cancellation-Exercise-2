//
//  Problem2b.swift
//  HW 2
//
//  Problem 2b
//  Created by PHYS 440 Marco on 1/24/24.
//

import Foundation

class Problem2b {
    static func calculateRelativeError(N: Int) -> Double {
        // Assuming S_N^(3) is the exact answer
        let exactAnswer = calculateS3(N: N)

        // Calculate S_N^(1) using calculateS function from Problem2a.swift
        let approximateAnswer = calculateS(for: Float(N)).0

        // Calculate relative error
        let relativeError = abs(Double(approximateAnswer) - Double(exactAnswer)) / abs(Double(exactAnswer))

        return relativeError
    }

    // Function to calculate S_N^(3) (exact answer)
    private static func calculateS3(N: Int) -> Float {
        var result: Float = 0.0
        for n in 1...N {
            let term = Float(2 * n) / Float(2 * n + 1)
            result += term
        }
        return result
    }

    static func calculateIterations() -> [Int] {
        var iterations: [Int] = []

        // Loop through N values for 10 iterations
        for n in 1...10 {
            iterations.append(n)
        }

        return iterations
    }
}






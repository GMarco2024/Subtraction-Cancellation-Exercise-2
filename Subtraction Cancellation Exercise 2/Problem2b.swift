//
//  Problem2b.swift
//
//  Homework 2
//  Problem 2b - Log-Log Plot
//
//  Marco Gonzalez PHYS-440
//

import Foundation

class Problem2b {
    static func calculateLog10RelativeError(for N: Int) -> [String] {
        var results: [String] = []

        for n in 1...N {
            let s1 = calculateS1(n: n)
            let s3 = calculateS3(n: n)
            let relativeError = abs((s1 - s3) / s3)
            let log10RelativeError = log10(relativeError)
            results.append("N = \(n): = \(log10RelativeError)")
        }

        return results
    }

    static func calculateLog10N(for N: Int) -> [String] {
        var results: [String] = []

        for n in 1...N {
            let log10N = log10(Double(n))
            results.append("N = \(n):  = \(log10N)")
        }

        return results
    }

    private static func calculateS1(n: Int) -> Double {
        var sum: Double = 0.0
        for i in 1...(2 * n) {
            sum += pow(-1.0, Double(i)) * Double(i) / Double(i + 1)
        }
        return sum
    }

    private static func calculateS3(n: Int) -> Double {
        var sum: Double = 0.0
        for i in 1...n {
            sum += 2.0 * Double(i) / (2.0 * Double(i) + 1.0)
        }
        return sum
    }
}








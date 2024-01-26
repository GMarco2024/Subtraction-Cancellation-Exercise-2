//
//  ContentView.swift
//
//  Homework 2
//  Problem 2a - Write a single precision program that calcaultes S^(1), S^(2), and S^(3).
//
//  Marco Gonzalez PHYS-440
//

import Foundation

func calculateS(for N: Float) -> (Float, Float, Float) {
    var s1: Float = 0.0
    var s2: Float = 0.0
    var s3: Float = 0.0
    
    // Convert N to an integer
    
    let nInt = Int(N)
    
    // Calculate S^(1)
    
    for n in 1...(2 * nInt) {
        s1 += pow(-1.0, Float(n)) * Float(n) / Float(n + 1)
    }
    
    // Calculate S^(2)
    
    for n in 1...nInt {
        s2 -= (2 * Float(n) - 1) / (2 * Float(n)) + 2 * Float(n) / (2 * Float(n) + 1)
    }
    
    // Calculate S^(3)
    
    for n in 1...nInt {
        s3 += 2 * Float(n) / (2 * Float(n) + 1)
    }
    
    return (s1, s2, s3)
}


//
//  Problem2a.swift
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
  //
  //  (1)      __ 2N    /      n   n    \
  //  S     =  \        | ( - 1)  ----- |
  //  N       /__ n = 1 \        n + 1  /
  
    for n in 1...(2 * nInt) {
        s1 += pow(-1.0, Float(n)) * Float(n) / Float(n + 1)
    }
    
   // Calculate S^(2)
   //    (2)        __ N      /2n - 1\      __ N       2n
   //   S     =   - \         |------|  +  \         ------
   //   N           /__ n = 1 \  2n  /     /__ n = 1 2n + 1
    
    
    for n in 1...nInt {
        s2 -= (2 * Float(n) - 1) / (2 * Float(n)) + 2 * Float(n) / (2 * Float(n) + 1)
    }
    
    // Calculate S^(3)
    //
    //   (3)       __ N       2n
    //  S      =  \         ------
    //  N         /__ n = 1 2n + 1


    
    for n in 1...nInt {
        s3 += 2 * Float(n) / (2 * Float(n) + 1)
    }
    
    return (s1, s2, s3)
}


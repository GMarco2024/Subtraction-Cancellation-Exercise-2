//
//  ContentView.swift
//
//  Homework 2
//  Problem 2b - Assume S^(3) to be the exact answer. Plot a log-log plot...
//
//  Marco Gonzalez PHYS-440
//
// This is just a "test". I'm just using copied data to visual how the plot would show up in the ContentView.swift's GUI

import SwiftUI

struct Problem1bPlotView: View {
    var body: some View {
        VStack {
            Text("Plot of y = exp(-x)")
                .underline(true, color: .black)
                .font(.system(size: 20))
                .padding(.top, 20)
            
            GeometryReader { geometry in
                // This grabs the data and plots it
                Path { path in
                    let data: [(Double, Double)] = [
                        (-2.0, 7.38905609893065),
                        (-1.8, 6.0496474644129465),
                        (-1.6, 4.953032424395115),
                        (-1.4, 4.0551999668446745),
                        (-1.2, 3.3201169227365472),
                        (-1.0, 2.718281828459045),
                        (-0.8, 2.2255409284924674),
                        (-0.6, 1.8221188003905087),
                        (-0.4, 1.4918246976412701),
                        (-0.2, 1.2214027581601699),
                        (0.0, 1.0),
                        (0.2, 0.8187307530779817),
                        (0.4, 0.6703200460356391),
                        (0.6, 0.5488116360940264),
                        (0.8, 0.44932896411722145),
                        (1.0, 0.36787944117144233),
                        (1.2, 0.301194211912202),
                        (1.4, 0.24659696394160638),
                        (1.6, 0.20189651799465538),
                        (1.8, 0.1652988882215865),
                        (2.0, 0.1353352832366127),
                    ]
                    for (index, point) in data.enumerated() {
                        let x = point.0
                        let y = point.1
                        let pointX = CGFloat(x) * 20 + geometry.size.width / 2
                        let pointY = geometry.size.height - CGFloat(y) * 20
                        if index == 0 {
                            path.move(to: CGPoint(x: pointX, y: pointY))
                        } else {
                            path.addLine(to: CGPoint(x: pointX, y: pointY))
                        }
                    }
                }
                .stroke(Color.blue, lineWidth: 2)
                
            
            }
        }
    }
}

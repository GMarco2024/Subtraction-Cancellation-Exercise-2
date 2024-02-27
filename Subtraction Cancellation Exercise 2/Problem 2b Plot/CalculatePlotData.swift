//
//  CalculatePlotData.swift
//  Charts Plot Observation
//
//  Created by Jeff_Terry on 1/15/24.
//  Modified by Marco Gonzalez 2/11/24
//
//  Reference for plotting
//  https://github.com/jterry94/Charts-Plot-Observation

import Foundation
import SwiftUI
import Observation


@Observable class CalculatePlotData {
    
    var plotDataModel: PlotDataClass? = nil
    var theText = ""
    
    
    /// Set the Plot Parameters
    /// - Parameters:
    ///   - color: Color of the Plotted Data
    ///   - xLabel: x Axis Label
    ///   - yLabel: y Axis Label
    ///   - title: Title of the Plot
    ///   - xMin: Minimum value of x Axis
    ///   - xMax: Maximum value of x Axis
    ///   - yMin: Minimum value of y Axis
    ///   - yMax: Maximum value of y Axis
    @MainActor func setThePlotParameters(color: String, xLabel: String, yLabel: String, title: String, xMin: Double, xMax: Double, yMin:Double, yMax:Double) {
        //set the Plot Parameters
        plotDataModel!.changingPlotParameters.yMax = yMax
        plotDataModel!.changingPlotParameters.yMin = yMin
        plotDataModel!.changingPlotParameters.xMax = xMax
        plotDataModel!.changingPlotParameters.xMin = xMin
        plotDataModel!.changingPlotParameters.xLabel = xLabel
        plotDataModel!.changingPlotParameters.yLabel = yLabel
        
        if color == "Red"{
            plotDataModel!.changingPlotParameters.lineColor = Color.red
        }
        else{
            
            plotDataModel!.changingPlotParameters.lineColor = Color.blue
        }
        plotDataModel!.changingPlotParameters.title = title
        
        plotDataModel!.zeroData()
    }
    
    /// This appends data to be plotted to the plot array
    /// - Parameter plotData: Array of (x, y) points to be added to the plot
    @MainActor func appendDataToPlot(plotData: [(x: Double, y: Double)]) {
        plotDataModel!.appendData(dataPoint: plotData)
    }
  
    
    //Functions for plotting from HW 2 Problem.
    
    func log10N() async {
        let N = 1000 // Example range for N values
        var plotData: [(x: Double, y: Double)] = []

        for n in 1...N {
            let logValue = log10(Double(n))
            // For plotting, treat n as x and logValue as y
            plotData.append((x: Double(n), y: logValue))
        }

        await setThePlotParameters(color: "Blue", xLabel: "N", yLabel: "log10(N)", title: "Plot of log10(N)", xMin: 1.0, xMax: Double(N), yMin: plotData.first?.y ?? 0.0, yMax: plotData.last?.y ?? 1.0)
        
        await appendDataToPlot(plotData: plotData)
       
        
    }
    
    //Functions for plotting from HW 2 Problem.
    
    func plotSN3() async {
            let N = 1000 // Example value for N
            var sumSN3: Double = 0
            var plotData: [(x: Double, y: Double)] = []

            for n in 1...N {
                let term = (2.0 * Double(n)) / (2.0 * Double(n) + 1.0)
                sumSN3 += term
                // For plotting, we can treat n as x and the sum up to n as y
                plotData.append((x: Double(n), y: sumSN3))
        }
        
        //set the Plot Parameters
        await setThePlotParameters(color: "Red", xLabel: "n", yLabel: "S_N^{(3)}", title: "Plot of S_N^{(3)}", xMin: 1.0, xMax: Double(N), yMin: 0.0, yMax: sumSN3)
        
        await appendDataToPlot(plotData: plotData)
      
        
        return
    }
    
    
        }
    


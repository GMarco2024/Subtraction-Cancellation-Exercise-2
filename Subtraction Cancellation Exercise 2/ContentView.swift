//
//  ContentView.swift
//  Charts Plot Observation
//
//  Modified by Marco Gonzalez 2/11/24
//

import SwiftUI
import Charts

struct ContentView: View {
    @Environment(PlotClass.self) var plotData
    
    @State private var calculator = CalculatePlotData()
    @State private var inputN4: String = ""
    @State var isChecked:Bool = false
    @State var tempInput = ""
    @State var selector = 0
    @State private var inputN: String = ""
    @State private var inputN2: String = ""
    @State private var inputN3: String = ""
    @State private var resultS1: Float = 0.0
    @State private var resultS2: Float = 0.0
    @State private var resultS3: Float = 0.0
    @State private var errorMessage: String? = nil
    @State private var log10RelativeErrors: [String] = []
    @State private var log10NResults: [String] = []
    
    var body: some View {
        
        @Bindable var plotData = plotData
        
        ScrollView{
            VStack{
                
                Text("Problem 2a - S(1), S(2), S(3) Calculations")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                Text("Single precision program")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Enter N", text: $inputN)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 450)
                    .padding()
                
                
                Button("Calculate") {
                    guard let n = Int(inputN) else {
                        resultS1 = 0.0
                        resultS2 = 0.0
                        resultS3 = 0.0
                        errorMessage = "I'm sorry, but you can only type integers. Please refrain from typing in non-integers."
                        return
                    }
                    
                    let (s1, s2, s3) = calculateS(for: Float(n))
                    resultS1 = s1
                    resultS2 = s2
                    resultS3 = s3
                    errorMessage = nil
                    
                }
                
                .padding()
                
                Text("S^(1) = \(resultS1)")
                Text("S^(2) = \(resultS2)")
                Text("S^(3) = \(resultS3)")
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                Text("Problem 2b - Calculations")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                
                Image("Equation 2.121")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.vertical, -100)
                
                Text("We calculate left side:")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Enter N (Ex: 1,000,000)", text: $inputN2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 450)
                    .padding()
                
                Button("Calculate log10|(SN(1)-SN(3)/SN(3)|") {
                    guard let n = Int(inputN2), n > 0 else {
                        errorMessage = "Please enter a valid integer for N."
                        return
                        
                    }
                    
                    log10RelativeErrors = Problem2b.calculateLog10RelativeError(for: n)
                }
                .padding()
                
                ForEach(log10RelativeErrors, id: \.self) { error in
                    Text(error)
                }
                
                Spacer()
                
                Text("Problem 2b (Cont.) - Calculations")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                
                Text("We calculate right side:")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Enter N (Ex: 1,000,000)", text: $inputN3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 450)
                    .padding()
                
                Button("Calculate log10(N)") {
                    guard let n = Int(inputN3), n > 0 else {
                        errorMessage = "Please enter a valid integer for N."
                        return
                   
                    }
                    log10NResults = Problem2b.calculateLog10N(for: n)
                }
                .padding()
                
                ForEach(log10NResults, id: \.self) { result in
                    Text(result)
                    
                }
                
                Spacer()
                Spacer()
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
              
                }
                
                Text("Problem 2b Plot")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                
                Text("We plot N = 1,000,000 for the problem asked.")
                    .font(.headline)
                    .fontWeight(.regular)
                
                Text("Note: Considering the large number of a million, it may take a while for points to be generated.")
                    .foregroundColor(.red)
                    .font(.headline)
                    .fontWeight(.regular)
                
                Group{
                    
                    HStack(alignment: .center, spacing: 0) {
                        
                        Text($plotData.plotArray[selector].changingPlotParameters.yLabel.wrappedValue)
                            .rotationEffect(Angle(degrees: -90))
                            .foregroundColor(.red)
                            .padding()
                        VStack {
                            Chart($plotData.plotArray[selector].plotData.wrappedValue) {
                                LineMark(
                                    x: .value("Position", $0.xVal),
                                    y: .value("Height", $0.yVal)
                                    
                                )
                                .foregroundStyle($plotData.plotArray[selector].changingPlotParameters.lineColor.wrappedValue)
                                PointMark(x: .value("Position", $0.xVal), y: .value("Height", $0.yVal))
                                
                                    .foregroundStyle($plotData.plotArray[selector].changingPlotParameters.lineColor.wrappedValue)
                                
                            }
                            .chartYScale(domain: [ plotData.plotArray[selector].changingPlotParameters.yMin ,  plotData.plotArray[selector].changingPlotParameters.yMax ])
                            .chartXScale(domain: [ plotData.plotArray[selector].changingPlotParameters.xMin ,  plotData.plotArray[selector].changingPlotParameters.xMax ])
                            .chartYAxis {
                                AxisMarks(position: .leading)
                            }
                            .padding()
                            Text($plotData.plotArray[selector].changingPlotParameters.xLabel.wrappedValue)
                                .foregroundColor(.red)
                        }
                    }
                    // .frame(width: 350, height: 400, alignment: .center)
                    .frame(alignment: .center)
                    
                }
                
                .padding()
                
                Divider()
                
                HStack{
                    Button("plotSN3", action: {
                        
                        Task.init{
                            
                            self.selector = 0
                            await self.calculate()
                        }
                    }
                           
                    )
                    .padding()
                    
                }
                
                HStack{
                    Button("Log10N", action: { Task.init{
                        
                        self.selector = 1
                        
                        await self.calculate2()

                    }
                    }
                           
                    )
                    .padding()
                    
                }
            }
        }
    }
    
    @MainActor func setupPlotDataModel(selector: Int){
        
        calculator.plotDataModel = self.plotData.plotArray[selector]
    }
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate() async {
        
        //pass the plotDataModel to the Calculator
        
        await setupPlotDataModel(selector: 0)
        
        let _ = await withTaskGroup(of:  Void.self) { taskGroup in
            
            taskGroup.addTask {
                
    //Calculate the new plotting data and place in the plotDataModel
    
                await calculator.plotSN3()
                
            }
        }
    }
    
    /// calculate
    /// Function accepts the command to start the calculation from the GUI
    func calculate2() async {
        
        await setupPlotDataModel(selector: 1)
         
        let _ = await withTaskGroup(of:  Void.self) { taskGroup in
            
            taskGroup.addTask {
                     
                //Calculate the new plotting data and place in the plotDataModel
                await calculator.log10N()
                
            }
        }
    }
}
    
    #Preview {
        ContentView()
    }
    
    
    



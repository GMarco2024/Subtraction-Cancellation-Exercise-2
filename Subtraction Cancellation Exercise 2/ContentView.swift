import SwiftUI

struct ContentView: View {
    @State private var inputN: String = ""
    @State private var resultS1: Float = 0.0
    @State private var resultS2: Float = 0.0
    @State private var resultS3: Float = 0.0
    @State private var errorMessage: String? = nil
    
    var body: some View {
        VStack {
            Text("S(1), S(2), S(3) Calculations")
                .underline(true, color: .black)
                .font(.system(size: 20))
                .padding(.top, 20)
            
            TextField("Enter N", text: $inputN)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Calculate") {
                // Check if inputN is a valid integer
                guard let n = Int(inputN) else {
                    // Reset result variables and display error message
                    resultS1 = 0.0
                    resultS2 = 0.0
                    resultS3 = 0.0
                    errorMessage = "I'm sorry, but you can only type integers. Please refrain from typing in non-integers."
                    return
                }
                
                // This calculates the results for the input value of N
                let (s1, s2, s3) = calculateS(for: Float(n))
                resultS1 = s1
                resultS2 = s2
                resultS3 = s3
                
                // Reset error message
                errorMessage = nil
            }
            .padding()
            
            // Displays the results of S^(1), S^(2), and S^(3)
            Text("S^(1) = \(resultS1)")
            Text("S^(2) = \(resultS2)")
            Text("S^(3) = \(resultS3)")
            
            // Display error message if present
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Spacer()
            
            // Call view from Problem1b.swift to display the plot
            Problem1bPlotView()
                .padding(.bottom) // Add padding at the bottom
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    // Function to calculate S^(1), S^(2), and S^(3) for a given N
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}











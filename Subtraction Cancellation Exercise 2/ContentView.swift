import SwiftUI

struct ContentView: View {
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
    
    @State private var inputN: String = ""
    @State private var resultS1: Float = 0.0
    @State private var resultS2: Float = 0.0
    @State private var resultS3: Float = 0.0
    
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
                // Calculate results for the input value of N
                if let n = Float(inputN) {
                    let (s1, s2, s3) = calculateS(for: n)
                    resultS1 = s1
                    resultS2 = s2
                    resultS3 = s3
                }
            }
            .padding()
            
            // Display the results of S^(1), S^(2), and S^(3)
            Text("S^(1) = \(resultS1)")
            Text("S^(2) = \(resultS2)")
            Text("S^(3) = \(resultS3)")
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}









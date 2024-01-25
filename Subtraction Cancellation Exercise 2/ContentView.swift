import SwiftUI

struct ContentView: View {
    // Function to calculate S^(1), S^(2), and S^(3)
    func calculateS() -> (Float, Float, Float) {
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
    
    let N: Float = 100 // Define the value of N
    
    var body: some View {
        VStack {
            Text("S(1), S(2), S(3) Calculations")
                .underline(true, color: .black)
                .font(.system(size: 20))
                .padding(.top, 20)
            
            // Display the results of S^(1), S^(2), and S^(3)
            let (resultS1, resultS2, resultS3) = calculateS()
            Text("S^(1) = \(resultS1)")
            Text("S^(2) = \(resultS2)")
            Text("S^(3) = \(resultS3)")
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







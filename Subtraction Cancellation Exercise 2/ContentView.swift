import SwiftUI

struct ContentView: View {
    @State private var inputN: String = ""
    @State private var inputN2: String = ""
    @State private var inputN3: String = ""
    @State private var resultS1: Float = 0.0
    @State private var resultS2: Float = 0.0
    @State private var resultS3: Float = 0.0
    @State private var errorMessage: String? = nil
    @State private var log10RelativeErrors: [String] = [] // To store results of problem 2b
    
    var body: some View {
        ScrollView{
            VStack {
                Text("Problem 2a - S(1), S(2), S(3) Calculations")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                    .padding(.top, 20)
                
                // Description of the test case for quadratic roots
                Text("Single precision program")
                    .font(.headline)
                    .fontWeight(.regular)
                
                //Displays the calculations for S^(1), S^(2), and S^(3)
                TextField("Enter N", text: $inputN)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth:450)
                    .padding()
                
                Button("Calculate") {
                    // Check if input N is a valid integer. It will display an error message if it is not.
                    guard let n = Int(inputN) else {
                        // Reset result variables and display error message
                        resultS1 = 0.0
                        resultS2 = 0.0
                        resultS3 = 0.0
                        errorMessage = "I'm sorry, but you can only type integers. Please refrain from typing in non-integers."
                        return
                    }
                    
                    // This calls the function calculatesS for the results of s1, s2, s3
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
                Spacer()
                
                Text("Problem 2b -  Calculations")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                
                Image("Equation 2.121")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.vertical, -100)
                
                Text("We calculate log10|(SN(1)-SN(3)/SN(3)|:")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Enter N (Ex: 1,000,000)", text: $inputN2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 450)
                    .padding()
                
                Button("Calculate") {
                    // Ensure input is a valid integer
                    guard let n = Int(inputN2), n > 0 else {
                        self.errorMessage = "Please enter a valid integer for N."
                        return
                    }
                    
                    self.log10RelativeErrors = Problem2b.calculateLog10RelativeError(for: n)
                }
                .padding()
                
                ForEach(log10RelativeErrors, id: \.self) { error in
                    Text(error)
                }
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)

            }
                
                Text("Problem 2b (Cont.) -  Calculations")
                    .underline(true, color: .black)
                    .font(.system(size: 20))
                
                
                Text("We calculate log10(N):")
                    .font(.headline)
                    .fontWeight(.regular)
                
                TextField("Enter N (Ex: 1,000,000)", text: $inputN3)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 450)
                    .padding()
                
        }
        Spacer()
            Spacer()
        }
    }
}
   

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

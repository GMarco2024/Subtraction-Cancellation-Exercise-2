import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("S(1), S(2), S(3) Calculations")
                .underline(true, color: .black)
                .font(.system(size: 20))
                .padding(.top, 20) // Add padding to separate title from top edge
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






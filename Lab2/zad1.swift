
import SwiftUI

struct ContentView: View {
    let kolory = [Color.red, Color.orange, Color.yellow, Color.green, Color.blue, Color.purple]
    
    var body: some View {
        ZStack {
            ForEach(0..<kolory.count) {
                Rectangle().fill(kolory[$0]).frame(width: 200, height: 200).offset(x: CGFloat($0) * 10.0,y: CGFloat($0) * 10.0)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

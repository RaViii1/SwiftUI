
import SwiftUI

struct ContentView: View {
    @State private var textColor = Color.black
    var body: some View {
        let longPressGesture = LongPressGesture()
            .onEnded { _ in
                self.textColor = self.textColor == Color.black ? Color.blue : Color.black
            }
        let text = "Hello, World!"
        return Text(text)
            .font(.title)
            .foregroundColor(textColor)
            .gesture(longPressGesture)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

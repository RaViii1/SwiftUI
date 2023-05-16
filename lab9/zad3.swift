import SwiftUI
struct GeometryView: View {
    @State private var position = CGSize.zero
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .offset(x: position.width, y: position.height)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.position = value.translation
                        }
                )
            Spacer()
            Text("Reset")
                .font(.title)
                .gesture(
                    LongPressGesture()
                        .onChanged { _ in
                            self.position = .zero
                        }
                )
            Spacer()
        }
    }
}
struct ContentView: View {
    var body: some View {
        GeometryView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("piesel").resizable().aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text("pies").foregroundColor(.green).font(.title)
                    Text("Nieznany autor").foregroundColor(.green)
                }
                .padding()
                Spacer()
            }
            .background(.white.opacity(0.5)).border(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView{
                view1()
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

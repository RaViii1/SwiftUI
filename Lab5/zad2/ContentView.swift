import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView{
                mainView()
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

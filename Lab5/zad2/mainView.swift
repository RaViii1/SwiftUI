
import SwiftUI

struct mainView: View {
    var body: some View {
        VStack{
            NavigationLink("Volkswagen", destination: marka1()).font(.title)
            NavigationLink("BMW", destination: marka2()).font(.title)
            NavigationLink("Audi", destination: marka3()).font(.title)
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}

import SwiftUI

struct marka1: View {
    var body: some View {
        VStack{
            Text("Volkswagen Tiguan").font(.title)
            Text("od 140 690 zł z VAT")
        }
    }
}

struct marka1_Previews: PreviewProvider {
    static var previews: some View {
        marka1()
    }
}

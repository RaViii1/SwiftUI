import SwiftUI

struct PanelView: View {
  @Binding var ileRazy: Int
  var body: some View{
    VStack{
      Button(action: {
        ileRazy += 1
      }){
        Text("Wcisnij")
      }
    }
  }
}

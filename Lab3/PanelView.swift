import SwiftUI

struct ContentView: View{
  @State var ileRazy : Int = 0
  var body: some View{
    VStack(alignment: .center){
      Text("Wcisnij przycisk").foregroundColor(.blue)
      PanelView(ileRazy: $ileRazy)
      Text("Wcisnieto \(ileRazy) razy").foregroundColor(.blue)
          }.padding()
    }
  }
struct ContentView_Previews: PreviewProvider{
  static var previews: some View{
    ContentView()
  }
}

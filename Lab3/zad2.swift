import SwiftUI

struct ContentView: View {
    
    var sizes = ["185/60 R14", "195/65 R15", "205/55 R16"]
    var prducent = ["Toyo", "GoodYear", "Dunlop", "GoodRide"]
    var m = [[5, 2, 8], [0, 3, 6], [1, 4, 7], [4, 4, 4]]
    
    @State private var selectedSize = ""
    @State private var selectedProducent = ""
    @State private var liczbaOpon: Int = 0
    @State var dost : String = ""
    
    var body: some View {
        VStack {
            Picker(selection: $selectedSize, label: Text("Rozmiar"), content: {
                        ForEach(sizes, id: \.self) {Text($0)}
                    }).pickerStyle(MenuPickerStyle())
                    
            Picker(selection: $selectedProducent, label: Text("Firma"), content: {
                        ForEach(prducent, id: \.self) {Text($0)}
                    }).pickerStyle(MenuPickerStyle())
            
            HStack(alignment: .center) {
                    Text("Liczba Opon:")
                    TextField("liczba", text: Binding(
                    get: {String(liczbaOpon)}, set: {liczbaOpon = Int($0) ?? 0}))
                        .frame(width: 60)
                        .border(.black)
                }
                    Button(action: {
                        if m[prducent.firstIndex(of: selectedProducent) ?? 0][sizes.firstIndex(of: selectedSize) ?? 0] >= liczbaOpon {
                            dost = "Opony sa dostepne"
                        }
                        else {
                            dost = "Opony nie sa dostepne"
                        }
                    }){Text("Sprawdz")}
                    Text("\(dost)")
                }
                .padding()
            }
    }

struct ContentView_Previews: PreviewProvider{
  static var previews: some View{
    ContentView()
  }
}

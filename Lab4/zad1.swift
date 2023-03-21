import SwiftUI

struct ContentView: View {
    @State var waluty : [String] = ["PLN", "USD", "EUR", "GBP", "CHF"]
    @State var wyb_k : String = ""
    @State var wyb_s : String = ""
    @State var wartosc : Double = 0.00
    @State var wynik : Double = 0.00
    @State var kupno : [Double] = [1.0, 3.9, 4.8, 5.33, 4.81]
    @State var przelicznik : Double = 1.005
    @State private var showAlert = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Kantor").foregroundColor(.white).font(.largeTitle)
                Spacer()
            }.background(.cyan)
            
            VStack {
                Text("Godziny otwarcia:").foregroundColor(.black).font(.title)
                HStack{
                    Spacer()
                    Text("Od pon-pt od godz: 8:00 - 16:00").foregroundColor(.black)
                    Spacer()
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(.cyan, lineWidth: 4))
            Spacer()
            HStack {
                Text("Wartosc:")
                TextField("liczba", text: Binding(
                    get: {String(wartosc)}, set: {wartosc = Double($0) ?? 0.00})).frame(width: 55)
                Picker(selection: $wyb_s, label: Text("Sprzedaz"), content: {
                    ForEach(waluty, id: \.self) {Text($0)}
                }).pickerStyle(MenuPickerStyle())
            }
            
            HStack {
                Text("Otzrymasz: ")
                Text(String(format: "%.2f", wynik))
                Picker(selection: $wyb_k, label: Text("Kupno"), content: {
                                ForEach(waluty, id: \.self) {Text($0)}
                            }).pickerStyle(MenuPickerStyle())
            }
            Button(action: {
                wynik = wartosc * kupno[waluty.firstIndex(of: wyb_s) ?? 0] * (1.0 / (kupno[waluty.firstIndex(of: wyb_k) ?? 0] * przelicznik))
            }){Text("Przelicz walutę").font(.title)}
            Spacer()
            Button("Kontakt") {
                   showAlert = true
            }.font(.title)
            .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Email:"),
                        message: Text("example@gmail.com")
                    )
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

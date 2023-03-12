import SwiftUI

struct ContentView: View {
    @State var b1: Int = 0
    @State var b2: Int = 0
    @State var b3: Int = 0
    @State var wynik: String = ""
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Podaj Bok 1:")
                TextField("0", text: Binding(get: {String(b1)}, set:{b1 = Int($0) ?? 0})).frame(width: 60).border(.black)
            }
            HStack {
                Text("Podaj Bok 2:")
                TextField("0", text: Binding(get: {String(b2)}, set:{b2 = Int($0) ?? 0})).frame(width: 60).border(.black)
            }
            HStack {
                Text("Podaj Bok 3:")
                TextField("0", text: Binding(get: {String(b3)}, set:{b3 = Int($0) ?? 0})).frame(width: 60).border(.black)
            }
            Button(action: {
                if b1 + b2 > b3 && b2 + b3 > b1 && b1 + b3 > b2 {
                    wynik = "Da sie zbudowac trojkat"
                }
                else {
                    wynik = "Nie da sie zbudowac trojkata"
                }
            }, label: {Text("Trojkat")})
            Text("Podano \(b1), \(b2), \(b3)")
            Text("\(wynik)").foregroundColor(wynik.contains("Nie") ? .red : .green)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

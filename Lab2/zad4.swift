struct ContentView: View {
  
    @State var liczba1: Int = 0
    @State var liczba2: Int = 0
  
    @State var wynik: Double? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            HStack{
                Text("Podaj pierwszą liczbę całkowitą").foregroundColor(.gray)
                TextField("Liczba 1", text: Binding(
                    get: { String(liczba1) },
                    set: { liczba1 = Int($0) ?? 0 }
                ))
            }
            HStack{
                Text("Podaj drugą liczbę całkowitą").foregroundColor(.gray)
                TextField("Liczba 2", text: Binding(
                    get: { String(liczba2) },
                    set: { liczba2 = Int($0) ?? 0 }
                ))
            }
            HStack{
                Button(action: {
                    wynik = Double(liczba1 + liczba2)
                }, label: {
                    Text("+").foregroundColor(.red)
                })
                Button(action: {
                    wynik = Double(liczba1 - liczba2)
                }, label: {
                    Text("-").foregroundColor(.red)
                })
                Button(action: {
                    wynik = Double(liczba1 * liczba2)
                }, label: {
                    Text("*").foregroundColor(.red)
                })
              
                Button(action: {
                    if liczba2 != 0 {
                        wynik = Double(liczba1) / Double(liczba2)
                    } else {
                        wynik = nil
                    }
                }, label: {
                    Text("/").foregroundColor(.red)
                })
            }
            if let wynik = wynik {
                Text("Wynik: \(wynik)")
            } else if liczba2 == 0 {
                Text("Nie dzielimy przez 0!")
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

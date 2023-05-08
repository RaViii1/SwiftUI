import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DomyView(), label: {
                    Text("Domy").font(.title)
                })
                NavigationLink(destination: MieszkaniaView(), label: {
                    Text("Mieszkania").font(.title)
                })
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

struct Dom {
    var nazwa : String
    var powierzchnia : Float
    var pokoje : Int
    var dzialka : Float
    var pietra : Int
}

struct DomyView: View {
    @State var domy : [Dom] = [
        Dom(nazwa: "Dom 1", powierzchnia: 120, pokoje: 7, dzialka: 5500, pietra: 2), Dom(nazwa: "Dom 2", powierzchnia: 80, pokoje: 6, dzialka: 10000, pietra: 1), Dom(nazwa: "Dom 3", powierzchnia: 100, pokoje: 6, dzialka: 4000, pietra: 2)]
    var body: some View {
            VStack {
                List{
                    ForEach(0..<domy.count) {
                        i in NavigationLink(destination: DomView(dom: $domy[i]), label: {
                            Text(domy[i].nazwa)
                        })
                    }
                }
            }
    }
}

struct DomyView_Previews: PreviewProvider {
    static var previews: some View {
        DomyView()
    }
}

struct Mieszkanie {
    var nazwa : String
    var powierzchnia : Float
    var pokoje : Int
    var dwupoziomowe : Bool
}

struct MieszkaniaView: View {
    @State var mieszkania : [Mieszkanie] = [Mieszkanie(nazwa: "Mieszkanie 1", powierzchnia: 40, pokoje: 3, dwupoziomowe: false), Mieszkanie(nazwa: "Mieszkanie 2", powierzchnia: 50, pokoje: 4, dwupoziomowe: false), Mieszkanie(nazwa: "Mieszkanie 3", powierzchnia: 65, pokoje: 5, dwupoziomowe: true)
    ]
    var body: some View {
        List{
            ForEach(0..<mieszkania.count) {
                i in NavigationLink(destination: MieszkanieView(mieszkanie: $mieszkania[i]), label: {
                    Text(mieszkania[i].nazwa)
                })
            }
        }
    }
}

struct MieszkaniaView_Previews: PreviewProvider {
    static var previews: some View {
        MieszkaniaView()
    }
}

struct DomView: View {
    @Binding var dom : Dom
    var body: some View {
        VStack {
            Text("Nazwa: " + dom.nazwa).font(.title)
            Text("Powierzchnia: " + String(dom.powierzchnia) + " m2").font(.title)
            Text("Pokoje: " + String(dom.pokoje)).font(.title)
            Text("Dzialka: " + String(dom.dzialka) + " m2").font(.title)
            Text("Pietra: " + String(dom.pietra)).font(.title)
        }
    }
}

struct DomView_Previews: PreviewProvider {
    static var previews: some View {
        DomView(dom: .constant(Dom(nazwa: "", powierzchnia: 0, pokoje: 0, dzialka: 0, pietra: 0)))
    }
}

struct MieszkanieView: View {
    @Binding var mieszkanie : Mieszkanie
    var body: some View {
        VStack {
            Text("Nazwa: " + mieszkanie.nazwa).font(.title)
            Text("Powierzchnia: " + String(mieszkanie.powierzchnia) + " m2").font(.title)
            Text("Pokoje: " + String(mieszkanie.pokoje)).font(.title)
            Text("Dwupoziomowe: " + String(mieszkanie.dwupoziomowe)).font(.title)
        }
    }
}

struct MieszkanieView_Previews: PreviewProvider {
    static var previews: some View {
        MieszkanieView(mieszkanie: .constant(Mieszkanie(nazwa: "", powierzchnia: 0, pokoje: 0, dwupoziomowe: false)))
    }
}

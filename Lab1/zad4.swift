import SwiftUI

struct ContentView: View {
    
    @State var liczba1 : Double = 0.0
    @State var liczba2 : Double = 0.0
  
    @State var liczba1s : String = ""
    @State var liczba2s : String = ""
    
    @State var answer : String = ""
    
    var body: some View {
        VStack (alignment: .center){
            Text("Podaj dwie liczby rzeczywiste").foregroundColor(.gray)
            TextField("Wpisz pierwszą liczbę całkowitą", text: $liczba1s) .multilineTextAlignment(.center)
            TextField("Wpisz drugą liczbę całkowitą", text: $liczba2s) .multilineTextAlignment(.center)
            Button(action: {
                if let number = Double(liczba1s), let number2 = Double(liczba2s){
                              liczba1 = number
                              liczba2 = number2
                    if liczba2 != 0.0 {
                            answer = String(liczba1 / liczba2)
                        } else {
                            answer = "Nie można dzielić przez zero!"
                        }
                          }
                else {
                        answer = "Wprowadziles niepoprawne dane!"
                           }
                       }, label: {
                           Text("Oblicz iloraz").foregroundColor(.purple)
                       })
            Text("\(answer)").foregroundColor(.gray)
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

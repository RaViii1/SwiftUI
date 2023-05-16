import SwiftUI
struct Car: Identifiable {
    let id = UUID()
    let brand: String
    let model: String
    let logo: String
}



struct ContentView: View {
    @State private var cars = [
        Car(brand: "Audi", model: "A4", logo: "logo3"),
        Car(brand: "Volskwagen", model: "golf 4", logo: "logo2"),
        Car(brand: "Toyota", model: "yaris", logo: "logo1")
    ]
    var body: some View {
        NavigationView {
            List {
                ForEach(cars) { car in
                    CarRow(car: car)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button(action: {
                                self.cars.removeAll(where: { $0.id == car.id })
                            }) {
                                Image(systemName: "trash")
                            }
                            .foregroundColor(.white)
                            .background(Color.red)
                        }
                }
            }
            .navigationBarTitle("Cars")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

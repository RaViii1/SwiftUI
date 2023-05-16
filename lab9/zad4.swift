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
                        .gesture(
                            TapGesture()
                                .onEnded { _ in
                                    withAnimation {
                                        self.cars.removeAll(where: { $0.id == car.id })
                                            }
                                        }
                            )
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


import SwiftUI

struct CarRow: View {
    let car: Car
    var body: some View {
        HStack {
            Image(car.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            Text("\(car.brand) \(car.model)")
                .font(.title)
        }
    }
}

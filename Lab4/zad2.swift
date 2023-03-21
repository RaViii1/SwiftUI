

import SwiftUI

struct ContentView: View {
    private let shapes: [String] = ["Kwadrat", "Koło"]
    private let colours: [String:Color] = ["Czerwony": Color.red, "Zielony": Color.green, "Niebieski": Color.blue, "Fioletowy": Color.purple, "Zółty": Color.yellow]
    @State private var selectedShape: String = "Figura"
    @State private var selectedColour: String = "Czerwony"
    @State private var shapeSize: Int = 100
    @State private var frameSize: Int = 4
    @State private var withFrame = true
        
    var body: some View {
        VStack {
            HStack{
                Text("Wybierz figurę:")
                Picker(selection: $selectedShape, label: Text("Figura")) {
                    ForEach(shapes, id: \.self) { shape in
                        Text(shape)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            HStack{
                Text("Wybierz kolor:")
                Picker(selection: $selectedColour, label: Text("Color")) {
                    ForEach(Array(colours.keys), id: \.self) { key in
                        Text(key)
                    }
                }.pickerStyle(MenuPickerStyle())
            }
            
            HStack {
                Text("Rozmiar figury:").padding(.horizontal)
                TextField("Rozmiar figury", text: Binding(
                    get: { String(self.shapeSize) },
                    set: { self.shapeSize = Int($0) ?? self.shapeSize })
                )
            }.multilineTextAlignment(.center).padding()
            
            VStack {
                HStack{
                    Toggle("Ramka", isOn: $withFrame)
                        .padding(.horizontal)
                   
                }
                HStack{
                    Text("Rozmiar ramki:").padding(.horizontal)
                    TextField("Rozmiar ramki", text: Binding(
                        get: { String(self.frameSize) },
                        set: { self.frameSize = Int($0) ?? self.frameSize })
                    )
                }
                
            }.multilineTextAlignment(.trailing).padding().border(Color.black)
            
            Spacer()
            if selectedShape == "Kwadrat" {
                Rectangle()
                    .fill(self.colours[self.selectedColour]!)
                    .padding(CGFloat(self.frameSize))
                    .frame(width: CGFloat(self.shapeSize+self.frameSize*2), height: CGFloat(self.shapeSize+self.frameSize*2))
                .border(Color.black, width: self.withFrame == true ? CGFloat(self.frameSize) : 0)
            }
            else if selectedShape == "Koło" {
                Circle()
                .fill(self.colours[self.selectedColour]!)
                .padding(CGFloat(self.frameSize))
                .frame(width: CGFloat(self.shapeSize+self.frameSize*2), height: CGFloat(self.shapeSize+self.frameSize*2))
                .border(Color.black, width: self.withFrame == true ? CGFloat(self.frameSize) : 0)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


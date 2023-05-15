//.............................\\
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            FirstView()
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//.............................\\
struct FirstView: View {
    @State var event_list : [Event] = [
        Event(name: "Wydarzenie_1", duration: 0), Event(name: "Wydarzenie_2", duration: 0), Event(name: "Wydarzenie_3", duration: 0)
    ]
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(0..<event_list.count) {
                        e in NavigationLink(destination: SecondView(edata: $event_list[e])) {
                            EventView(edata: $event_list[e])
                        }
                    }
                }
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
//.............................\\
struct SecondView: View {
    @State var name : String = ""
    @State var duration : Double = 0
    @State var isEditing = false
    @Binding var edata : Event
    var body: some View {
        VStack {
            Text("Nazwa wydarzenia")
            TextField("nazwa", text: Binding(
                get: {String(name)}, set: {name = String($0)}))
            Text("Czas trwania")
            Slider(value: $duration, in: 0...60, step: 5, onEditingChanged: {editing in isEditing=editing})
            Text("\(Int(duration)) min").foregroundColor(isEditing ? .red : .blue)
            Button(action: {
                edata.name = name
                edata.duration = Int(duration)
            }) {
                Text("Dodaj")
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(edata: .constant(Event(name: "", duration: 0)))
    }
}
//.............................\\
struct EventView: View {
    @Binding var edata : Event
    var body: some View {
        HStack {
            Text(edata.name)
            Text(" - ")
            Text(String(edata.duration))
            Text("min")
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(edata: .constant(Event(name: "", duration: 0)))
    }
}

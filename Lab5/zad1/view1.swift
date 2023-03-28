import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct view1: View {
    var body: some View {
        VStack{
            Spacer()
            Triangle().fill(.red).frame(width: CGFloat(200), height: CGFloat(200))
            Spacer()
            NavigationLink("Przejdź dalej", destination: view2()).font(.title)
            Spacer()
        }
    }
}

struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}

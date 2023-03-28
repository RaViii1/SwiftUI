import SwiftUI

struct view2: View {
    var body: some View {
        Spacer()
        ZStack{
            Rectangle().fill(.gray)
                .frame(width: 200,height: 200).border(.teal, width: 10)
            Rectangle().fill(.white)
                .frame(width: 91,height: 182)
                .offset(x:45, y:-1)
            Rectangle().fill(.yellow)
                .frame(width: 89,height: 89)
                .offset(x:45,y:-46)
        }
        Spacer()
        NavigationLink("Przejdź dalej", destination: view3()).font(.title)
        Spacer()
    }
}

struct view2_Previews: PreviewProvider {
    static var previews: some View {
        view2()
    }
}

import SwiftUI

struct view3: View {
    var body: some View {
        Spacer()
        ZStack{
            Rectangle()
                .fill(.white)
                .border(.blue, width: 2)
                .frame(width: 350, height: 250)
                
            RoundedRectangle(cornerRadius: 50)
                .fill(.blue)
                .frame(width: 250, height: 250)
            Capsule()
                .fill(.green)
                .frame(width: 250, height: 100)
            Circle()
                .fill(.red)
                .frame(width: 75, height: 75)
        }

        Spacer()
    }
}

struct view3_Previews: PreviewProvider {
    static var previews: some View {
        view3()
    }
}

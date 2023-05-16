//
//  ContentView.swift
//  lab9.1
//
//  Created by student on 16/05/2023.
//

import SwiftUI
struct ContentView: View {
    @State private var currentImageIndex = 0
    @State private var isShowingTitle = false
    let images = ["1", "2", "3", "4", "5"]
    var body: some View {
        VStack {
            Image(images[currentImageIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < 0 {
                                self.currentImageIndex = min(self.currentImageIndex + 1, self.images.count - 1)
                            } else if value.translation.width > 0 {
                                self.currentImageIndex = max(self.currentImageIndex - 1, 0)
                            }
                        }
                )
                .onLongPressGesture {
                    self.isShowingTitle.toggle()
                }
            if isShowingTitle {
                Text("Pies numer: \(images[currentImageIndex])")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

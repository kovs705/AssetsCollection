//
//  ColorfulBlobs.swift
//
//
//  Created by Kovs on 02.08.2023.
//  Copyright © 2023 CodingKovs. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
extension BlurredBackgrounds {
    
    @available(iOS 15.0, *)
    struct BackgroundBlob: View {
        @State private var rotationAmount = 0.0
        let alignment: Alignment = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing].randomElement()!
        let color: Color = [.blue, .cyan, .indigo, .mint, .purple, .teal].randomElement()!
        
        //Use this for brighter colors!
        //let color: Color = [.blue, .blue, .blue, .cyan, .indigo, .mint, .orange, .pink, .purple, .red, .teal, .yellow].randomElement()!
        
        var body: some View {
            Ellipse()
                .fill(color)
                .frame(width: .random(in: 200...500), height: .random(in: 200...500))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
                .offset(x: .random(in: -400...400), y: .random(in: -400...400))
                .rotationEffect(.degrees(rotationAmount))
                .animation(.linear(duration: .random(in: 20...40)).repeatForever(), value: rotationAmount)
                .onAppear {
                    rotationAmount = .random(in: -360...360)
                }
                .blur(radius: 75)
        }
    }

}
@available(iOS 13.0, *)
struct BlurredBackgrounds: View {
    var body: some View {
        ZStack {
            if #available(iOS 15.0, *) {
                ForEach(0..<15) { _ in
                    BackgroundBlob()
                }
            } else {
                Text("Update to iOS 15 to see blobs!")
            }
        }
    }
}


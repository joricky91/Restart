//
//  OnboardingCenterView.swift
//  Restart
//
//  Created by Jonathan Ricky on 28/11/23.
//

import SwiftUI

struct OnboardingCenterView: View {
    @Binding var imageOffset: CGSize
    @Binding var isAnimating: Bool
    @Binding var textTitle: String
    @Binding var indicatorOpacity: Double
    
    var body: some View {
        ZStack {
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                .offset(x: imageOffset.width * -1)
                .blur(radius: abs(imageOffset.width / 5))
                .animation(.easeOut(duration: 1), value: imageOffset)
            
            Image("character-1")
                .resizable()
                .scaledToFit()
                .opacity(isAnimating ? 1 : 0)
                .animation(.easeInOut(duration: 0.5), value: isAnimating)
                .offset(x: imageOffset.width * 1.2, y: 0)
                .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if abs(imageOffset.width) <= 150 {
                                imageOffset = gesture.translation
                                
                                withAnimation(.linear(duration: 0.25)) {
                                    indicatorOpacity = 0
                                    textTitle = "Give."
                                }
                            }
                        }
                        .onEnded { _ in
                            imageOffset = .zero
                            
                            withAnimation(.linear(duration: 0.25)) {
                                indicatorOpacity = 1
                                textTitle = "Share."
                            }
                        }
                )
                .animation(.easeOut(duration: 1), value: imageOffset)
        }
        .overlay(Image(systemName: "arrow.left.and.right.circle")
            .font(.system(size: 44, weight: .ultraLight))
            .foregroundColor(.white)
            .offset(y: 20)
            .opacity(isAnimating ? 1 : 0)
            .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
            .opacity(indicatorOpacity)
                 , alignment: .bottom
        )
    }
}

//#Preview {
//    OnboardingCenterView()
//}

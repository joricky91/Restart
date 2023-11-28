//
//  OnboardingFooterView.swift
//  Restart
//
//  Created by Jonathan Ricky on 28/11/23.
//

import SwiftUI

struct OnboardingFooterView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @Binding var buttonOffset: CGFloat
    @Binding var isAnimating: Bool
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            // background (static)
            Capsule()
                .fill(.white.opacity(0.2))
            
            Capsule()
                .fill(.white.opacity(0.2))
                .padding(8)
            
            // call to action
            Text("Get Started")
                .font(.system(.title3, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .offset(x: 20)
            
            // capsule (dynamic button)
            HStack {
                Capsule()
                    .fill(Color("ColorRed"))
                    .frame(width: buttonOffset + 80)
                
                Spacer()
            }
            // circle (draggable)
            HStack {
                ZStack {
                    Circle()
                        .fill(Color("ColorRed"))
                    
                    Circle()
                        .fill(.black.opacity(0.15))
                        .padding(8)
                    
                    Image(systemName: "chevron.right.2")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                }
                .foregroundColor(.white)
                .frame(width: 80, height: 80, alignment: .center)
                .offset(x: buttonOffset)
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                buttonOffset = gesture.translation.width
                            }
                        }
                        .onEnded { _ in
                            if buttonOffset > buttonWidth / 2 {
                                hapticFeedback.notificationOccurred(.success)
                                playSound(sound: "chimeup", type: "mp3")
                                buttonOffset = buttonWidth - 80
                                isOnboardingViewActive = false
                            } else {
                                hapticFeedback.notificationOccurred(.warning)
                                buttonOffset = 0
                            }
                        }
                )
                
                Spacer()
            }
        }
        .frame(width: buttonWidth, height: 80, alignment: .center)
        .padding()
        .opacity(isAnimating ? 1 : 0)
        .offset(y: isAnimating ? 0 : 40)
        .animation(.easeOut(duration: 1), value: isAnimating)
    }
}

//#Preview {
//    OnboardingFooterView()
//}

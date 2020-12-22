//
//  ContentView.swift
//  codeTutorial_segmentAnimations
//
//  Created by Christopher Guirguis on 5/16/20.
//  Copyright © 2020 Christopher Guirguis. All rights reserved.
//

import SwiftUI

struct LoquyContentView: View {
    @State var toggled = true
    var buttonDimensions:CGFloat = 50
    var body: some View {
        
        VStack{
            ZStack{
                HStack(spacing:0){
                    Spacer().frame(height: 30).frame(maxWidth: .infinity)
                    ///.background(Color.red)
                    Spacer().frame(height: 30).frame(maxWidth: toggled ? 0 : buttonDimensions)
                    ///.background(Color.yellow)
                    Spacer().frame(height: 30).frame(maxWidth: toggled ? 0 : .infinity)
                    Circle().frame(width: buttonDimensions, height: buttonDimensions).foregroundColor(Color.blue)
                    Spacer().frame(height: 30).frame(maxWidth: !toggled ? 0 : .infinity)
                    Spacer().frame(height: 30).frame(maxWidth: !toggled ? 0 : buttonDimensions)
                    ///.background(Color.yellow)
                    Spacer().frame(height: 30).frame(maxWidth: .infinity)
                }
                HStack(spacing:0){
                    Spacer()
                    Button(action: {
                        self.toggled = true
                    }) {
                        Image(systemName: "text.bubble")
                            .font(.system(size: 25))
                            .foregroundColor(toggled ? Color.white : Color.init(white: 0.8))
                    }.frame(width: buttonDimensions, height:buttonDimensions)
                    Spacer()
                    Button(action: {
                        self.toggled = false
                    }) {
                        Image(systemName: "list.bullet.below.rectangle")
                        .font(.system(size: 25))
                        .foregroundColor(!toggled ? Color.white : Color.init(white: 0.8))
                    }.frame(width: buttonDimensions, height:buttonDimensions)
                    Spacer()
                }
                
            }.animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 6))
            if toggled {
                RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.red).opacity(0.5)
                .transition(
                    AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
                )
                    .animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 3.5))
            } else {
                RoundedRectangle(cornerRadius: 15).padding().foregroundColor(.blue).opacity(0.5)
                .transition(
                    AnyTransition.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing))
                        
                )
                    .animation(Animation.interpolatingSpring(stiffness: 330, damping: 20.0, initialVelocity: 3.5))
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoquyContentView()
    }
}

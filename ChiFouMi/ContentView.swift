//
//  ContentView.swift
//  ChiFouMi
//
//  Created by Luc Derosne on 20/10/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//
import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
    }
}

extension View {
    func titleStyle() -> some View {
        return self.modifier(Title())
    }
}

struct ContentView: View {
    @State private var moveOptions = ["✊", "✋", "✌️"]
    @State private var score: Int = 0
    @State private var isToWinn = Bool.random()
    @State private var chosenOption = Int.random(in: 0...2)
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.gray, Color.purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
                VStack {
                    Text("Score: \(score)")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)

                    Spacer()
                    
                    ZStack {
                        Color.green
                            .clipShape(Circle())
                        VStack {
                            Text(moveOptions[chosenOption])
                                .font(.largeTitle)
                            isToWinn ?
                                Text("Gagnez !") : Text("Perdez !")
                        }.padding(5)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button(action: { self.buttonAction(index: 0) }) {
                            Text("✊")
                        }
                        Button(action: { self.buttonAction(index: 1) }) {
                            Text("✋")
                        }
                        Button(action: { self.buttonAction(index: 2) }) {
                            Text("✌️")
                        }
                    }.padding(20)
                     .scaleEffect(2)
                     .font(.largeTitle)
                    
                    Spacer()
                }.padding(100)
                }.navigationBarTitle(Text("Chi Fou Mi"))

        }
    }
    
    func buttonAction(index: Int) {
        switch index {
        case 0:
            if isToWinn {
                if chosenOption == 2 {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if chosenOption == 1 {
                    score += 1
                } else {
                    score -= 1
                }
            }
        case 1:
            if isToWinn {
                if chosenOption == 0 {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if chosenOption == 2 {
                    score += 1
                } else {
                    score -= 1
                }
            }
        case 2:
            if isToWinn {
                if chosenOption == 1 {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if chosenOption == 0 {
                    score += 1
                } else {
                    score -= 1
                }
            }
        default:
            return
        }
        
        chosenOption = Int.random(in: 0...2)
        isToWinn = Bool.random()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

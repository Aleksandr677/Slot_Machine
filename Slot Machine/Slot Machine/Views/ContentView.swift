//
//  ContentView.swift
//  Slot Machine
//
//  Created by Христиченко Александр on 2022-11-11.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            //MARK: - INTERFACE
            VStack(alignment: .center, spacing: 5) {
                //MARK: - HEADER
                LogoView()
                
                Spacer()
                
                //MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    } //HStack
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("200")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    } //HStack
                    .modifier(ScoreContainerModifier())
                }
                
                //MARK: - SLOT MACHINE
                
                //MARK: - FOOTER
                
                Spacer()
            } //VStack
            .overlay(alignment: .topLeading, content: {
                //RESET
                Button {
                    print("Reset the game")
                } label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .modifier(ButtonModifier())
                }
            })
            
            .overlay(alignment: .topTrailing, content: {
                //INFO
                Button {
                    print("Info view")
                } label: {
                    Image(systemName: "info.circle")
                        .modifier(ButtonModifier())
                }
            })
            .padding()
            .frame(maxWidth: 720)
            
            //MARK: - POPUP
        } //ZStack
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

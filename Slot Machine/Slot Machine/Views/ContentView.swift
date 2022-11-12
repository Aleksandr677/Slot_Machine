//
//  ContentView.swift
//  Slot Machine
//
//  Created by Христиченко Александр on 2022-11-11.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var showingInfoView: Bool = false
    
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
                VStack(alignment: .center , spacing: 0) {
                    //MARK: - REEL #1
                    ZStack {
                        ReelView()
                        
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        //MARK: - REEL #2
                        ZStack {
                            ReelView()
                            
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        
                        Spacer()
                        
                        //MARK: - REEL #3
                        ZStack {
                            ReelView()
                            
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    //MARK: - SPIN BUTTON
                    Button {
                        print("Spin the reels")
                    } label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    
                } //SLOT MACHINE
                .layoutPriority(2)
                
                //MARK: - FOOTER
                Spacer()
                
                HStack {
                    //MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button {
                            print("Bet 20 coins")
                        } label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(0)
                            .modifier(CasinoChipsModifier())
                    }
                    
                    //MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(1)
                            .modifier(CasinoChipsModifier())
                        
                        Button {
                            print("Bet 10 coins")
                        } label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    } //HStack
                } //HStack
            } //VStack
            //MARK: - BUTTONS
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
                    showingInfoView = true
                } label: {
                    Image(systemName: "info.circle")
                        .modifier(ButtonModifier())
                }
            })
            .padding()
            .frame(maxWidth: 720)
            
            //MARK: - POPUP
        } //ZStack
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

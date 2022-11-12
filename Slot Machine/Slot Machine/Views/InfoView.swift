//
//  InfoView.swift
//  Slot Machine
//
//  Created by Христиченко Александр on 2022-11-12.
//

import SwiftUI

struct InfoView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
                    
                    FormRowView(firstItem: "Developer", secondItem: "Alex Kh.")
                    
                    FormRowView(firstItem: "Designer", secondItem: "Diana Kh.")
                    
                    FormRowView(firstItem: "Music", secondItem: "Diana Kh.")
                    
                    FormRowView(firstItem: "Website", secondItem: "swiftuimasterclass.com")
                    
                    FormRowView(firstItem: "Copyright", secondItem: "© 2022 All rights reserved")
                    
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                } //Section
            } //Form
            .font(.system(.body, design: .rounded))
        } //VStack
        .padding(.top, 40)
        .overlay(alignment: .topTrailing) {
            Button {
                audioPlayer?.stop()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding(.top, 30)
            .padding(.trailing, 20)
            .tint(.secondary)
        }
        .onAppear {
            playSound(sound: "background-music", type: "mp3")
        }
    }
}

//MARK: - FORMROWVIEW
struct FormRowView: View {
    var firstItem: String
    var secondItem: String
    
    var body: some View {
        HStack {
            Text(firstItem)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(secondItem)
        }
    }
}

//MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

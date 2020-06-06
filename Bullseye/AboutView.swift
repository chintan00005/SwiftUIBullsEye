//
//  AboutView.swift
//  Bullseye
//
//  Created by Chintan Antani on 03/06/20.
//  Copyright © 2020 Chintan Antani. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
           let bgColor = Color(red:255/255, green:214/255,blue:179/255)
    
    struct headingStyle:ViewModifier{
        func body(content: Content) -> some View {
           return content.foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 30)).padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
        }
    }
    
    struct detailsStyle:ViewModifier{
        func body(content: Content) -> some View{
           return content.foregroundColor(Color.black)
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .padding(EdgeInsets(top:0,leading: 60,bottom:20,trailing: 60))
        }
    }
    
    var body: some View {
 
        Group{
        VStack{
            Text("🎯 BullsyEye 🎯").modifier(headingStyle())
            Text("🎯 BullsyEye 🎯").modifier(detailsStyle())
            Text("🎯 BullsyEye 🎯").modifier(detailsStyle())
            Text("🎯 BullsyEye 🎯").modifier(detailsStyle())
            }.background(bgColor)
               .navigationBarTitle("About App")
        }.background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

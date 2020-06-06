//
//  ContentView.swift
//  Bullseye
//
//  Created by Chintan Antani on 26/05/20.
//  Copyright © 2020 Chintan Antani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAlertVisible = false
    @State var sliderValue = 50.0
    @State var userScore = 0
    @State var roundValue = 1
    @State var  randomValue = Int.random(in: 1...100)
    let btnIconColor = Color(red: 0.0/255, green: 51/255, blue: 102/255)
    
    struct shadowStyle:ViewModifier{
        func body(content: Content) -> some View {
            return content.shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    struct layoutStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content.modifier(shadowStyle()).foregroundColor(Color.white)
                .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct yellowFontStyle:ViewModifier{
        func body(content: Content) -> some View {
            return content.modifier(shadowStyle())
                .foregroundColor(Color.yellow)
                .font(Font.custom("Arial Rounded MT Bold",size:24))
        }
    }
    
    struct blackBigFontStyle:ViewModifier{
         func body(content: Content) -> some View {
             return content.modifier(shadowStyle())
                 .foregroundColor(Color.black)
                 .font(Font.custom("Arial Rounded MT Bold",size:18))
         }
     }
    
    struct blackSmallFontStyle:ViewModifier{
         func body(content: Content) -> some View {
             return content.modifier(shadowStyle())
                 .foregroundColor(Color.black)
                 .font(Font.custom("Arial Rounded MT Bold",size:12))
         }
     }
    
    
    var body: some View {
        VStack {
            VStack {
                  Spacer()
                HStack {
                    Text("Select the value as close as you can!!").modifier(layoutStyle())
           
                    Text("\(randomValue)").modifier(yellowFontStyle())
                }
                Spacer()
                HStack {
                    Text("1").modifier(layoutStyle())
                    Slider(value:$sliderValue, in: 1...100)
                        .accentColor(Color.green)
                    Text("100").modifier(layoutStyle())
                           }
                       Spacer()
                Button(action: {
                    self.isAlertVisible = true
                
                }) {
                    Text("Click it!!")
                }
                .alert(isPresented: $isAlertVisible) { () -> Alert in
                    let displayValue:Int=roundedSliderValue()
                    return Alert(title: Text("\(alertTitle())"), message: Text("Slider's value is \(displayValue)\n"+"You have scored \(calculateScore()) points..."), dismissButton:.default(Text("Dismiss")){
                        self.userScore = self.userScore + self.calculateScore()
                        self.randomValue = Int.random(in: 1...100)
                        self.roundValue = self.roundValue + 1
                        })
                }
                .background(Image("Button"))
                       Spacer()
                HStack{
                    Button(action: {
                        self.startOver()
                               
                           }) {
                            HStack{
                                Image("StartOverIcon")
                                   Text("Start over")
                            }
                            
                    }.background(Image("Button"))
                        .accentColor(btnIconColor)
                      .modifier(blackSmallFontStyle())
                           Spacer()
                    HStack {
                        Text("Score:").modifier(layoutStyle())
                        Text(String(userScore)).modifier(yellowFontStyle())
                                     }
                           Spacer()
                    HStack {
                        Text("Round:").modifier(layoutStyle())
                        Text("\(roundValue)").modifier(yellowFontStyle())
                                        }
                           Spacer()
                    NavigationLink(destination:AboutView()){
                                            HStack{
                                                                           Image("InfoIcon")
                                                                              Text("Info")
                                                                       }
                    }.background(Image("Button"))
                      .accentColor(btnIconColor)
                    .modifier(blackBigFontStyle())
                }.padding(.bottom, 20)
            }.background(Image("Background"), alignment: .center)
            .accentColor(btnIconColor)
            .navigationBarTitle("BullsyEye")
    
        }
    }
    
    func startOver(){
       isAlertVisible = false
       sliderValue = 50.0
       userScore = 0
       roundValue = 1
       randomValue = Int.random(in: 1...100)
    }
    
    func diffBetvalues()->Int{
        return abs(roundedSliderValue() - randomValue)
    }
    func roundedSliderValue()->Int{
        return Int(sliderValue.rounded())
    }
    
    func calculateScore()->Int{
        var originalScore = 100 - diffBetvalues()
        if originalScore==100{
            originalScore = originalScore + 100
        }
        else if (originalScore+1)==100{
              originalScore = originalScore + 50
        }
        
        return originalScore
    }
    
    func alertTitle()->String{
        let diff = diffBetvalues()
        let title:String
        if diff==0{
            title = "Perfect!!"
        }
        else if diff<=5{
              title = "So close!!"
          }
        else if diff<=10{
                 title = "Try again!!"
             }
        else {
                 title = "Are you even trying!!"
             }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}

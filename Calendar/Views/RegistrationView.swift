//
//  RegistrationView.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var user : UserController
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordShow = false
    @State private var name = ""
    let sf = ScaleFactor()
    
    var body: some View {
        ZStack {
        Color("AccentColor").edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                    VStack{
                        HStack{
                            CustomHeader(firstText: "Sign Up", firstTextLenght: sf.h * 0.01, firstTextX: sf.w * 0.25, firstTextY: sf.h * 0.04, firstTextMaxWidth: sf.w * 0.5, firstTextFontSize: sf.w * 0.1 ).GenerateHeaderText()
                            CustomHeader(btnTrailingImageName: "xmark.circle.fill", btnTrailingWidth: sf.w * 0.2, btnTrailingHeight: sf.h * 0.01, btnTrailingCol: Color.white, btnAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            }, btnTrailingX: sf.w * 0.4, btnTrailingY: sf.h * 0.04, btnTrailingSize: sf.w * 0.1).GenerateButtonTrailing()
                        }
                        CustomHeader(secondText: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt", secondTextX: sf.w * 0.52, secondTextY: sf.h * 0.05, secondTextOpicity: 0.8, secondTextFontSize: sf.w * 0.03, lineLimit: 4).GenerateSecondText()
                        CustomHeader(rightRecHstackFill: Color("AccentColor"), rightRecHstackBorderCol: Color("textfield-end"), rightRecHstackWidth: sf.w * 0.4, rightRecHstackHeight: sf.h * 0.04, rightRecHstackPadding: sf.h * 0.06, rightRecHstackX: sf.w * -0.01 , rightRecHstackY: sf.h * 0.14 ,LeftRecHstackImage: "facebook", LeftRecHstackFill: Color("AccentColor"), LeftRecHstackBorderCol: Color("textfield-end"), LeftRecHstackWidth: sf.w * 0.4, LeftRecHstackHeight: sf.h * 0.04, LeftRecHstackPadding: sf.w * 0.5, LeftRecHstackX: sf.w * 0.2, LeftRecHstackY: sf.h * 0.14 ,HStackX: sf.w * 0.5, HStackY: sf.h * -0.03, HStackWidth: sf.w * 0.4 , HStackHeight: sf.h * 0.07).GenerateHstack()
                        Button {
                            
                        } label: {
                            Text("Or register with E-Mail…")
                                .font(.system(size: sf.w * 0.05))
                                .foregroundColor(Color.white)
                        }.position(x: sf.w * 0.5, y: sf.h * 0.09)
                            

                        TextField("", text: $email).modifier(LinearStyle(roundedCornes: 20, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white, lineWidth: sf.h * 0.037)).frame(width: sf.w * 0.85, height: sf.h * 0.05)
                            .position(x: sf.w * 0.5, y: sf.h * 0.14)
                        TextField("", text: $email).modifier(LinearStyle(roundedCornes: 20, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white, lineWidth: sf.h * 0.037)).frame(width: sf.w * 0.85, height: sf.h * 0.05)
                            .position(x: sf.w * 0.5, y: sf.h * 0.19)
                        TextField("", text: $email).modifier(LinearStyle(roundedCornes: 20, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white, lineWidth: sf.h * 0.037)).frame(width: sf.w * 0.85, height: sf.h * 0.05)
                            .position(x: sf.w * 0.5, y: sf.h * 0.24)
                        Button {
                            
                        } label: {
                            Text("Sign Up")
                                .font(.system(size: sf.w * 0.1))
                                .frame(maxWidth: .infinity, maxHeight: sf.h * 0.1, alignment: .center)
                        }.modifier(LinearStyle(roundedCornes: 30, startColor: Color("workEnd"), endColor: Color("workStart"), textColor: .white, lineWidth: sf.h * 0.02 ,shadowRadius: 1))
                            .frame(width: sf.w * 0.7, height: sf.h * 0.12)
                            .position(x: sf.w * 0.5, y: sf.h * 0.35)
                    }.onTapGesture {
                        self.endEditing()
                    }.ignoresSafeArea(.keyboard)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            }
        }
    private func endEditing() {
          UIApplication.shared.endEditing()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

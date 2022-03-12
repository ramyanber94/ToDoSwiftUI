//
//  LoginView.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @EnvironmentObject var user : UserController
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var isPasswordShow: Bool = false
    @State private var isSuccess: Bool = false
    @State private var isFail: Bool = false
    @State private var isRegistration: Bool = false
    let sf = ScaleFactor()
    
    var body: some View {
        NavigationView{
            VStack{
                CustomHeader(firstTextLenght: sf.h * 0.1, firstTextX: sf.w * 0.35, firstTextY: sf.h * -0.1,firstTextMaxWidth: sf.w * 0.5, firstTextFontSize: sf.w * 0.12).GenerateHeaderText()
                CustomHeader(secondTextX: sf.w * 0.5 , secondTextY: sf.h * -0.13, secondTextOpicity: 0.8, secondTextFontSize: sf.w * 0.035,lineLimit: 4).GenerateSecondText()
                    .padding(sf.h * 0.01)
                TextField("", text: $email).modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white, lineWidth: sf.h * 0.06)).frame(width: sf.w * 0.85, height: sf.h * 0.05)
                    .position(x: sf.w * 0.5, y: sf.h * -0.05)
                TextField("", text: $email).modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: Color.white, lineWidth: sf.h * 0.06)).frame(width: sf.w * 0.85, height: sf.h * 0.05)
                    .position(x: sf.w * 0.5, y: sf.h * 0.01)
                Button {
                } label: {
                    Text("Forgot password?").foregroundColor(.white).font(.system(size: sf.w * 0.04))
                }.position(x: sf.w * 0.75, y: sf.h * -0.02)
                Button {
                } label: {
                    Text("Or login with…").foregroundColor(.white).font(.system(size: sf.w * 0.04))
                }.position(x: sf.w * 0.5, y: sf.h * 0)
                CustomHeader(rightRecHstackFill: Color("AccentColor"), rightRecHstackBorderCol: Color("textfield-end"), rightRecHstackWidth: sf.w * 0.4, rightRecHstackHeight: sf.h * 0.07, rightRecHstackPadding: sf.h * 0.06, rightRecHstackX: sf.w * -0.01 , rightRecHstackY: sf.h * 0.04 ,LeftRecHstackImage: "facebook", LeftRecHstackFill: Color("AccentColor"), LeftRecHstackBorderCol: Color("textfield-end"), LeftRecHstackWidth: sf.w * 0.4, LeftRecHstackHeight: sf.h * 0.07, LeftRecHstackPadding: sf.w * 0.5, LeftRecHstackX: sf.w * 0.2, LeftRecHstackY: sf.h * 0.04 ,HStackX: sf.w * 0.5, HStackY: sf.h * -0.03, HStackWidth: sf.w * 0.4 , HStackHeight: sf.h * 0.07).GenerateHstack()
                CustomButton(text: "Login", fontSize: sf.w * 0.11, background: Color("button"), height: sf.h * 0.1, width: sf.w * 0.8, radius: sf.h * 0.04, x: sf.w * 0.5, y: sf.h * 0) {
                    
                }
                CustomButton(text: "Register", fontSize: sf.w * 0.11, background: Color("workStart"), height: sf.h * 0.1, width: sf.w * 0.8, radius: sf.h * 0.04, x: sf.w * 0.5, y: sf.h * 0.02) {
                    isRegistration.toggle()
                }
            }.onTapGesture {
                self.endEditing()
            }.background(Color("AccentColor"))
            .ignoresSafeArea(.keyboard)
        }.fullScreenCover(isPresented: $isRegistration) {
            RegistrationView()
        }
    }
    private func endEditing() {
          UIApplication.shared.endEditing()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


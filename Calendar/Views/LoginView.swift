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
    @State var email : String = ""
    @State var password : String = ""
    @State var isPasswordShow: Bool = false
    @State var isSuccess: Bool = false
    @State var isFail: Bool = false
    @State var isRegistration: Bool = false
    @State var isEmailValid : String = ""
    @State var isMain = false
    @State var offset : CGFloat = 0
    @State var offsetToggle : Bool = false
    @State var alertShow = false
    let sf = ScaleFactor()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    CustomHeader(firstTextLenght: sf.h * 0.1, firstTextX: sf.w * 0.35, firstTextY: sf.h * -0.07,firstTextMaxWidth: sf.w * 0.5, firstTextFontSize: sf.w * 0.12).GenerateHeaderText()
                    CustomHeader(secondTextX: sf.w * 0.5 , secondTextY: sf.h * -0.27, secondTextOpicity: 0.8, secondTextFontSize: sf.w * 0.035,lineLimit: 4).GenerateSecondText()
                        .padding(sf.h * 0.01)
                    HStack {
                            TextField("E-mail", text: $email).autocapitalization(.none)
                        if email.isValid(.email){
                            withAnimation {
                                Image("E-mail")
                            }
                        }
                    }.modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: .white))
                        .frame( maxWidth: sf.w * 0.87,maxHeight: sf.h * 0.05)
                        .position(x: sf.w * 0.5, y: sf.h * -0.15)
                
                    HStack {
                        if isPasswordShow {
                            TextField("Password", text: $password).autocapitalization(.none)
                        }else {
                            SecureField("Password", text: $password).autocapitalization(.none)
                        }
                        Button {
                            isPasswordShow.toggle()
                        }label:{
                            Image(self.isPasswordShow ? "eye_show" : "eye_close").frame(height: 10)
                        }
                    }.modifier(LinearStyle(roundedCornes: 10, startColor: Color("textfield-end"), endColor: Color("button"), textColor: .white))
                        .frame( maxWidth: sf.w * 0.87,maxHeight: sf.h * 0.05)
                        .position(x: sf.w * 0.5, y: sf.h * -0.1)
                      
                    Button {
                    } label: {
                        Text("Forgot password?").foregroundColor(.white).font(.system(size: sf.w * 0.04))
                        
                    }.position(x: sf.w * 0.75, y: sf.h * -0.09)
                    Button {
                    } label: {
                        Text("Or login with…").foregroundColor(.white).font(.system(size: sf.w * 0.04))
                    }.position(x: sf.w * 0.5, y: sf.h * -0.07)
                    CustomHeader(rightRecHstackFill: Color("AccentColor"), rightRecHstackBorderCol: Color("textfield-end"), rightRecHstackWidth: sf.w * 0.4, rightRecHstackHeight: sf.h * 0.07, rightRecHstackPadding: sf.h * 0.06, rightRecHstackX: sf.w * -0.01 , rightRecHstackY: sf.h * 0.04 ,LeftRecHstackImage: "facebook", LeftRecHstackFill: Color("AccentColor"), LeftRecHstackBorderCol: Color("textfield-end"), LeftRecHstackWidth: sf.w * 0.4, LeftRecHstackHeight: sf.h * 0.07, LeftRecHstackPadding: sf.w * 0.5, LeftRecHstackX: sf.w * 0.2, LeftRecHstackY: sf.h * 0.04 ,HStackX: sf.w * 0.5, HStackY: sf.h * -0.03, HStackWidth: sf.w * 0.4 , HStackHeight: sf.h * 0.07).GenerateHstack()
                    CustomButton(text: "Login", fontSize: sf.w * 0.07, background: Color("button"), height: sf.h * 0.07, width: sf.w * 0.8, radius: sf.h * 0.04, x: sf.w * 0.5, y: sf.h * 0) {
                        let check = user.getUser(email: email, password: password)
                        if check {
                            isMain.toggle()
                        }else{
                            alertShow.toggle()
                        }
                    }
                    CustomButton(text: "Register", fontSize: sf.w * 0.07, background: Color("workStart"), height: sf.h * 0.07, width: sf.w * 0.8, radius: sf.h * 0.04, x: sf.w * 0.5, y: sf.h * 0.02) {
                        isRegistration.toggle()
                    }
                }.alert(isPresented: $alertShow) {
                    return Alert(title: Text("Please enter correct credentials" as String))
                }
            }.background(Color("AccentColor"))
        }
            .fullScreenCover(isPresented: $isRegistration) {
            RegistrationView()
        }
        .fullScreenCover(isPresented: $isMain) {
            MainView()
        }
    }
}
    

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


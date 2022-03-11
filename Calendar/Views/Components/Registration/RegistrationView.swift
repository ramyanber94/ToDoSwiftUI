//
//  RegistrationView.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct RegistrationView: View {
    
    
    @EnvironmentObject var core : CoreDataService
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordShow = false
    @State private var name = ""
    let sf = ScaleFactor()
    
    var body: some View {
        ZStack {
            Color("AccentColor").edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView(.vertical){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },label: {
                            Image(systemName: "arrow.backward")
                                .font(Font.title3.weight(.heavy))
                                .foregroundColor(Color.white)
                        }).frame(maxWidth: .infinity,maxHeight: sf.h * 0.01, alignment: .leading)
                        RegistrationHeader(sf: sf).frame(width: sf.w * 1, height: sf.h * 0.38)
                        RegistrationTextFields(email: $email, password: $password, isPasswordShow: $isPasswordShow, name: $name)
                            .position(x: sf.w * 0.5, y: sf.h * 0.1)
                        signUp().position(x: sf.w * 0.5, y: sf.h * 0)
                    }.onTapGesture {
                        self.endEditing()
                    }.ignoresSafeArea(.keyboard)
                }
            }
        }
    private func endEditing() {
          UIApplication.shared.endEditing()
    }
    @ViewBuilder
    func signUp()-> some View{
        CustomButton(sf: sf, text: "Sign Up", fontSize: 20, hTextPadding: sf.w * 0.30, height: sf.h * 0.08){
            core.addUser(email: email, name: name, password: password)
        }
    }
}
    
    
    


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}


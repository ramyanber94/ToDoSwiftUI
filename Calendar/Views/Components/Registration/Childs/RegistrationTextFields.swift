//
//  RegistrationTextFields.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct RegistrationTextFields: View {
    
    let sf = ScaleFactor(w: UIScreen.main.bounds.size.width, h: UIScreen.main.bounds.size.height)
    var email: Binding<String>
    var password: Binding<String>
    var isPasswordShow : Binding<Bool>
    var name: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("E_mail")
                .font(.system(size: 15))
                .foregroundColor(Color.gray)
                .opacity(0.5)
            HStack {
                TextField("", text: email)
                    .autocapitalization(.none)
                if email.wrappedValue.isValid(.email) {
                    Image("E-mail")
                }
                
            }.modifier(CustomTextField(roundedCornes: 6, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
        
            Text("Name")
                .font(.system(size: 15))
                .foregroundColor(Color.gray)
                .opacity(0.5)
            HStack {
                TextField("", text: name)
                    .autocapitalization(.none)
                if name.wrappedValue.isValid(.name) {
                    Image("E-mail")
                }
                
            }.modifier(CustomTextField(roundedCornes: 6, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
      
            Text("Password")
                .font(.system(size: 15))
                .foregroundColor(Color.gray)
                .opacity(0.5)
            TogglePassword(isPasswordShow: isPasswordShow, text: password, action: {
                isPasswordShow.wrappedValue.toggle()
            })
        }.padding()

    }
}


//
//  TextFields.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct LoginTextFields: View {
    
    var sf = ScaleFactor()
    var email: Binding<String>
    var password: Binding<String>?
    var isPasswordShow : Binding<Bool>?
    
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
        }
        .padding()
        .position(x: sf.w * 0.5, y: sf.h * -0.01)
        VStack(alignment: .leading) {
            Text("Password")
                .font(.system(size: 15))
                .foregroundColor(Color.gray)
                .opacity(0.5)
            TogglePassword(isPasswordShow: isPasswordShow!, text: password!, action: {
                isPasswordShow?.wrappedValue.toggle()
            })
        }
        .padding()
        .position(x: sf.w * 0.5, y: sf.h * 0.04)
    }
}


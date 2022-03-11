//
//  TogglePassword.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct TogglePassword: View {

    var isPasswordShow: Binding<Bool>
    var text: Binding<String>
    var action: (() -> Void)

    var body: some View {
        HStack {
            secured()
            show()
        }.modifier(CustomTextField(roundedCornes: 6, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
    }

    @ViewBuilder
    func show() -> some View {
        if isPasswordShow.wrappedValue == true{
            TextField("", text: text)
                .autocapitalization(.none)
            Button(action: action) {
                Image("eye_show").frame(height: 10)
            }
        }
    }
    
    @ViewBuilder
    func secured() -> some View {
        if isPasswordShow.wrappedValue == false{
            SecureField("", text: text)
                .autocapitalization(.none)
            Button(action: action) {
                Image("eye_close").frame(height: 10)
            }
        }
    }
}



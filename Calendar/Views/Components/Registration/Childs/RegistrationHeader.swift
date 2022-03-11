//
//  RegistrationHeader.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct RegistrationHeader: View {
    
    let sf : ScaleFactor
    
    var body: some View {
        VStack{
            VStack{
                Text("Sign Up")
                    .font(.system(size: 35))
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt")
                    .font(.system(size: 15))
                    .lineLimit(nil)
                    .foregroundColor(Color.white)
                    .opacity(0.5)
                    .padding(5)
            }
            HStack{
                Rectangle()
                    .fill(Color("AccentColor"))
                    .frame(width: sf.w * 0.4, height: sf.h * 0.05)
                    .border(Color("textfield-end"))
                    .overlay {
                        Image("google")
                    }
                    .padding(5)
                Rectangle()
                    .fill(Color("AccentColor"))
                    .frame(width: sf.w * 0.4, height: sf.h * 0.05)
                    .border(Color("textfield-end"))
                    .overlay {
                        Image("facebook")
                    }
                    .padding(2)
            }.padding()
                .position(x: sf.w * 0.5, y: sf.h * 0.03)
            Button(action: {
            }){
                Text("Or register with E-Mail…")
                    .underline()
                    .foregroundColor(Color.white)
                    .opacity(0.5)
            }.position(x: sf.w * 0.5, y: sf.h * 0)
        }
    }
}



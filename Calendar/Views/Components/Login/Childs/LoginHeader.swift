//
//  Header.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct LoginHeader: View {
    
    var sf = ScaleFactor()
    
    var body: some View {
        Text("Login")
            .font(.system(size: 35))
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .position(x: sf.w * 0.48, y: sf.h * -0.07)
        Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt")
            .font(.system(size: 15))
            .lineLimit(nil)
            .foregroundColor(Color.white)
            .position(x: sf.w * 0.5, y: sf.h * -0.1)
            .opacity(0.5)
            .padding(5)
    }
}

//
//  CustomButton.swift
//  Calendar
//
//  Created by ramy on 2022-03-06.
//

import SwiftUI

struct CustomButton: View {
    
    var text = ""
    var fontSize: CGFloat?
    var hTextPadding: CGFloat?
    var background : Color?
    var height: CGFloat?
    var width: CGFloat?
    var radius: CGFloat?
    var x: CGFloat?
    var y: CGFloat?
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: self.action ?? {}) {
                Text(text)
                .font(Font.system(size: fontSize ?? 0).weight(.bold))
                .padding(.horizontal, hTextPadding ?? 0)
        }
        .foregroundColor(Color.white)
        .frame(width: width ?? 0, height: height ?? 0)
        .background(background)
        .cornerRadius(radius ?? 0)
        .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
        .position(x: x ?? 0, y: y ?? 0)
    }
}



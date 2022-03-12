//
//  AddToDoButton.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct LinearStyle: ViewModifier {
    var roundedCornes: CGFloat?
    var startColor: Color?
    var endColor: Color?
    var textColor: Color?
    var lineWidth: Double?
    var shadowRadius: Double?
    var padding: CGFloat?
    var fontSize: CGFloat?

    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [startColor ?? Color.white, endColor ?? Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCornes ?? 0)
            .padding(padding ?? 0)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCornes ?? 0)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor ?? Color.white, endColor ?? Color.black]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: lineWidth ?? 2.5))
            .font(.custom("Open Sans", size: fontSize ?? 0))
            .shadow(radius: shadowRadius ?? 0)
    }
}

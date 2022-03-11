//
//  AddToDoButton.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct AddToDoButton: View {
    
    var sf: ScaleFactor
    var action : (()-> Void)
    var body: some View {
        Button(action: action){
            ZStack{
                Circle()
                    .fill(
                        Color("button")
                    )
                    .frame(maxWidth: sf.w * 0.2, alignment: .leading)
                    .padding()
            }.overlay {
                Text("+").font(.system(size: 40)).foregroundColor(Color.white)
            }
        }
    }
}


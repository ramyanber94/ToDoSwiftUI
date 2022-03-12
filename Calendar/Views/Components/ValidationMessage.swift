//
//  ValidationMessage.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct ValidationMessage: View {
    var body: some View {
        Rectangle()
            .frame(width: 200, height : 160)
            .background(Color.white)
            .overlay {
            VStack{
                Text("Rajnjsad")
            }
        }
    }
}


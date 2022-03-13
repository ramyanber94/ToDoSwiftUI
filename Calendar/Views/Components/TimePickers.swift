//
//  TimePickers.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct TimePickers: View {
    
    var time : Binding<Date>
    
    var body: some View {
        DatePicker("Select Time", selection: time , displayedComponents: .hourAndMinute)
            .datePickerStyle(WheelDatePickerStyle())
    }
}


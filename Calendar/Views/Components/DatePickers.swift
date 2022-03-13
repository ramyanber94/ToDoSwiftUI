//
//  DateTimePickerToDo.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct DatePickers: View {
    
    var date: Binding<Date>
    
    var body: some View {
        DatePicker("Select date", selection: date)
            .datePickerStyle(GraphicalDatePickerStyle())
    }
}


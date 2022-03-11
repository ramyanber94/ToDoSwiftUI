//
//  AddNewToDoView.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI

struct AddNewToDoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var reminderText = ""
    @State private var section = "Work"
    @State private var date = Date()
    @State private var notes = ""
    let sf = ScaleFactor()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("AccentColor").edgesIgnoringSafeArea(.all)
                Form {
                    Text("Reminder Name")
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray)
                        .opacity(0.8)
                    TextField("", text: $reminderText)
                        .autocapitalization(.none)
                        .modifier(CustomTextField(roundedCornes: 6, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
                    Text("Category")
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray)
                        .opacity(0.8)
                    MenuSelector(text: $section)
                    Text("Category")
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray)
                        .opacity(0.8)
                    HStack{
                        ZStack {
                            DatePicker("label", selection: $date, displayedComponents: .date)
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                                .background(Color("AccentColor"))
                                .opacity(0)
                                .cornerRadius(0.5)
                                .frame(width: sf.w * 0.1, height: sf.h * 0.01)
                            Image(systemName: "calendar")
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Select Date").foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.system(size: 14))
                        }.modifier(CustomTextField(roundedCornes: 10, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
                        ZStack {
                            DatePicker("label", selection: $date, displayedComponents: .hourAndMinute)
                                .modifier(CustomTextField(roundedCornes: 10, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
                                .datePickerStyle(CompactDatePickerStyle())
                                .labelsHidden()
                                .cornerRadius(0.5)
                                .frame(width: sf.w * 0.1, height: sf.h * 0.01)
                            Image(systemName: "calendar")
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("Select Time").foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .font(.system(size: 14))
                        }.modifier(CustomTextField(roundedCornes: 10, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
                    }
                    Text("Note")
                        .font(.system(size: 15))
                        .foregroundColor(Color.gray)
                        .opacity(0.8)
                    TextEditor(text: $notes)
                        .modifier(CustomTextField(roundedCornes: 10, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
                        .frame(height: sf.h * 0.15)
                        .foregroundColor(self.notes == "Put your notes here" ? .gray : .white)
                        .onTapGesture {
                           if self.notes == "Put your notes here" {
                             self.notes = ""
                           }
                         }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },label: {
                        Image(systemName: "arrow.backward")
                            .font(.system(size: 15).weight(.heavy))
                            .foregroundColor(Color.white)
                    })
                }
            }
        }
    }
}

struct AddNewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewToDoView()
    }
}

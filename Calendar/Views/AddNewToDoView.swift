//
//  AddNewToDoView.swift
//  Calendar
//
//  Created by ramy on 2022-03-11.
//

import SwiftUI
import PickEmoji
import HalfModal

struct AddNewToDoView: View {
    
    init() {
          UITextView.appearance().backgroundColor = .clear
      }
    
    @EnvironmentObject var user : UserController
    @Environment(\.presentationMode) var presentationMode
    @State private var reminderText = ""
    @State private var section = "Work"
    @State private var date = Date()
    @State private var time = Date()
    @State private var notes = ""
    @State var isPickEmoji = false
    @State var isDate = false
    @State var isTime = false
    let sf = ScaleFactor()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("AccentColor").edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack {
                        Section(header: Text("Reminder Name").foregroundColor(Color.white).font(.system(size: sf.w * 0.025)).frame(maxWidth: .infinity, alignment: .leading).padding(5)) {
                            TextField("", text: $reminderText)
                                .autocapitalization(.none)
                                .modifier(LinearStyle(roundedCornes: 6, startColor: Color("AccentColor"), endColor: Color("textfield-end"), textColor: .white))
                                .frame(width: sf.w * 0.9, height: sf.h * 0.06)
                        }
                        Section(header: Text("Category").foregroundColor(Color.white).font(.system(size: sf.w * 0.025)).frame(maxWidth: .infinity, alignment: .leading).padding(5)) {
                            MenuSelector(text: $section)
                                .frame(width: sf.w * 0.9, height: sf.h * 0.1)
                        }
                        Section(header: Text("Date And Time").foregroundColor(Color.white).font(.system(size: sf.w * 0.025)).frame(maxWidth: .infinity, alignment: .leading).padding(5)) {
                            HStack{
                                Button {
                                    isDate.toggle()
                                } label: {
                                    HStack{
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color.white)
                                            .padding()
                                        Text("Select Date").foregroundColor(Color.white)
                                            .font(.system(size:  sf.w * 0.035))
                                            .padding()
                                    }.background(Color("AddSmily"))
                                        .cornerRadius(10)
                                }
                                Button {
                                    isTime.toggle()
                                } label: {
                                    HStack{
                                        Image(systemName: "calendar")
                                            .foregroundColor(Color.white)
                                            .padding()
                                        Text("Select Time").foregroundColor(Color.white)
                                            .font(.system(size: sf.w * 0.035))
                                            .padding()
                                    }.background(Color("AddSmily"))
                                        .cornerRadius(10)
                                }
                            }
                             
                        }
                        Section(header: Text("Note").foregroundColor(Color.white).font(.system(size: sf.w * 0.025)).frame(maxWidth: .infinity, alignment: .leading).padding(5)) {
                            TextEditor(text: $notes)
                                .frame(width: sf.w * 0.9 , height: sf.h * 0.12)
                                .foregroundColor(self.notes == "Put your notes here" ? .gray : .white)
                                .onTapGesture {
                                   if self.notes == "Put your notes here" {
                                     self.notes = ""
                                   }
                                }
                                .background(RoundedRectangle(cornerRadius: 20)
                                                .stroke(LinearGradient(gradient: Gradient(colors: [Color("AccentColor"), Color("textfield-end")]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 5))
                               
                        }
                        Section(header: Text("Add smiley").foregroundColor(Color.white).font(.system(size: sf.w * 0.025)).frame(maxWidth: .infinity, alignment: .leading).padding(5)) {
                            HStack{
//                                AddButton(sf: sf, action: {
//                                    notes += "😄"
//                                }, fontSize: sf.w * 0.05, color: "AddSmily", text: "😄")
//                                AddButton(sf: sf, action: {
//                                    notes += "😄"
//                                }, fontSize: sf.w * 0.05, color: "AddSmily", text: "😄")
//                                AddButton(sf: sf, action: {
//                                    notes += "😁"
//                                }, fontSize: sf.w * 0.05, color: "AddSmily", text: "😁")
//                                AddButton(sf: sf, action: {
//                                    notes += "😍"
//                                }, fontSize: sf.w * 0.05, color: "AddSmily", text: "😍")
//                                AddButton(sf: sf, action: {
//                                    notes += "🥰"
//                                }, fontSize: sf.w * 0.05, color: "AddSmily", text: "🥰")
//                                AddButton(sf: sf, action: {
//                                    withAnimation {
//                                                 isPickEmoji = true
//                                             }
//                                }, fontSize: sf.w * 0.05, color: "AddSmily")
                            }.frame(width: sf.w * 1, height: sf.h * 0.1)
                        }.position(x: sf.w * 0.5, y: sf.h * 0.02)
                    }.onTapGesture {
                        self.endEditing()
                    }.ignoresSafeArea(.keyboard)
                        .frame(minHeight: sf.h * 0.4, alignment: .topLeading)
                    CustomButton(text: "Create Reminder", fontSize: 20, hTextPadding: sf.w * 0.2, height: sf.h * 0.07){
                        user.addTodo(section: section , taskList: reminderText, status: "S", date: date, email: user.member.email!, password: user.member.password!)
                        print(user.member)
                    }.position(x: sf.w * 0.5, y: sf.h * 0.05)
                }
       
                
               
                if isPickEmoji {
                    HalfModalView(content: AnyView(PickAnyEmoji()) , header: AnyView(Text("Pick your emoji")), isPresented: $isPickEmoji)
                }
                if isDate {
                    HalfModalView(content: AnyView(DatePickers(date: $date)) , header: AnyView(Text("Pick your emoji")), isPresented: $isDate)
                }
                if isTime {
                    HalfModalView(content: AnyView(TimePickers(time: $time)) , header: AnyView(Text("Pick your emoji")), isPresented: $isTime)
                }
     
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },label: {
                        VStack{
                            Image(systemName: "arrow.backward")
                                .font(.system(size: 15).weight(.heavy))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("New Reminder").foregroundColor(Color.white).font(.title3)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    })
                }
            }
        }
    }
    private func endEditing() {
          UIApplication.shared.endEditing()
    }
}

struct AddNewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewToDoView()
    }
}

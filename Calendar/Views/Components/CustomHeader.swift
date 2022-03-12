//
//  Header.swift
//  Calendar
//
//  Created by ramy on 2022-03-10.
//

import SwiftUI

struct CustomHeader: View {
    var firstText : String?
    var firstTextLenght : CGFloat?
    var firstTextX : CGFloat?
    var firstTextY : CGFloat?
    var firstTextMaxWidth : CGFloat?
    var firstTextFontSize : CGFloat?
    
    var secondText : String?
    var secondTextX : CGFloat?
    var secondTextY : CGFloat?
    var secondTextOpicity : Double?
    var secondTextFontSize: CGFloat?
    var lineLimit: Int?
    
    var rightRecHstackImage : String?
    var rightRecHstackFill : Color?
    var rightRecHstackBorderCol : Color?
    var rightRecHstackWidth : CGFloat?
    var rightRecHstackHeight : CGFloat?
    var rightRecHstackPadding : CGFloat?
    var rightRecHstackX : CGFloat?
    var rightRecHstackY : CGFloat?
    
    var LeftRecHstackImage : String?
    var LeftRecHstackFill : Color?
    var LeftRecHstackBorderCol : Color?
    var LeftRecHstackWidth : CGFloat?
    var LeftRecHstackHeight : CGFloat?
    var LeftRecHstackPadding : CGFloat?
    var LeftRecHstackX : CGFloat?
    var LeftRecHstackY : CGFloat?
    
    var HStackX : CGFloat?
    var HStackY : CGFloat?
    var HStackWidth : CGFloat?
    var HStackHeight : CGFloat?
    
    var btnTrailingImageName: String?
    var btnTrailingWidth: CGFloat?
    var btnTrailingHeight: CGFloat?
    var btnTrailingCol: Color?
    var btnAction: (()-> Void)?
    var btnTrailingX: CGFloat?
    var btnTrailingY: CGFloat?
    var btnTrailingSize: CGFloat?
    
    var body: some View {
        GenerateHeaderText()
        GenerateButtonTrailing()
        GenerateSecondText()
    }
    @ViewBuilder
    func GenerateHstack()-> some View{
        HStack{
            Rectangle()
                .fill(rightRecHstackFill ?? Color("AccentColor"))
                .frame(width: rightRecHstackWidth ?? 0, height: rightRecHstackHeight ?? 0)
                .border(rightRecHstackBorderCol ?? Color("textfield-end"))
                .overlay {
                    Image(rightRecHstackImage ?? "google")
                }.padding(rightRecHstackPadding ?? 0)
                .position(x: rightRecHstackX ?? 0, y: rightRecHstackY ?? 0)
            Rectangle()
                .fill(LeftRecHstackFill ?? Color("AccentColor"))
                .frame(width: LeftRecHstackWidth ?? 0, height: LeftRecHstackHeight ?? 0)
                .border(LeftRecHstackBorderCol ?? Color("textfield-end"))
                .overlay {
                    Image(LeftRecHstackImage ?? "facebook")
                }.padding(LeftRecHstackPadding ?? 0)
                .position(x: LeftRecHstackX ?? 0, y: LeftRecHstackY ?? 0)
        }.frame(width: HStackWidth ?? 0, height: HStackHeight ?? 0)
            .position(x: HStackX ?? 0, y: HStackY ?? 0)
    }
    @ViewBuilder
    func GenerateButtonTrailing()-> some View{
        Button (action: btnAction ?? {
        }){
            Image(systemName: btnTrailingImageName ?? "magnifyingglass")
                .font(.system(size: btnTrailingSize ?? 0))
                .frame(width: btnTrailingWidth ?? 0, height: btnTrailingHeight ?? 0)
                .foregroundColor(btnTrailingCol ?? Color.white)
                .position(x: btnTrailingX ?? 0, y: btnTrailingY ?? 0)
        }
    }
    @ViewBuilder
    func GenerateHeaderText()-> some View{
        Text(firstText ?? "Login")
            .font(.system(size: firstTextFontSize ?? 0))
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity ,alignment: .leading)
            .padding(firstTextLenght ?? 0)
            .position(x: firstTextX ?? 0, y: firstTextY ?? 0)
    }
    @ViewBuilder
    func GenerateSecondText()-> some View{
        Text(secondText ?? "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt")
            .font(.system(size: secondTextFontSize ?? 0))
            .lineLimit(lineLimit ?? 0)
            .foregroundColor(Color.white)
            .frame(maxWidth: .infinity ,alignment: .leading)
            .position(x: secondTextX ?? 0, y: secondTextY ?? 0)
            .opacity(secondTextOpicity ?? 1.0)
    }
}

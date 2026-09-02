//
//  SearchTextField.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 01/09/26.
//

import SwiftUI

struct SearchTextField: View {
    
    @Binding var searchText: String
    var body: some View {
        HStack{
            HStack{
                Image(systemName: "magnifyingglass.circle.fill").resizable().frame(width: 30, height: 30).foregroundColor(Color(.gray))
                TextField("Searching mechanic...", text: $searchText).foregroundColor(.gray)
            }.font(.subheadline).padding().background(
                RoundedRectangle(cornerRadius: 90)
                    .shadow(color: .gray, radius: 13)
            ).frame(width: 300 ).foregroundColor(.white)
            ZStack {
               
                Circle().fill(.transparentBlack).frame(width: 60)
                Image(systemName: "car.badge.gearshape").resizable().frame(width: 30 , height: 30).gesture(TapGesture().onEnded{
                  
                }
               )
                
            }
        }
    }
}

#Preview {
    SearchTextField(searchText: .constant(""))
}

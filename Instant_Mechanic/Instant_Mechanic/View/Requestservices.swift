//
//  Requestservices.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 01/09/26.
//

import SwiftUI

struct Requestservices: View {
    @State private var isOnCarService = false
    @State private var isOnACService = false
    @State private var isOnTyre = false
    @State private var isOnBrake = false
    @State private var isOnBattery = false
    @State private var carno = ""
    @State private var paragraph: String = ""
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                        Text("Service Required").font(.system(size: 20 ,weight: .light ,design: .serif))
                    }
                    Divider()
                    
                    HStack{
                        Text("Car Service").font(.system(size: 20 , weight: .medium, design: .rounded))
                        Toggle("", isOn: $isOnCarService)
                            .toggleStyle(.switch)
                            .tint(.black)
                    }
                    Divider()
                    HStack{
                        Text("AC Service").font(.system(size: 20 , weight: .medium, design: .rounded))
                        Toggle("", isOn: $isOnACService)
                            .toggleStyle(.switch)
                            .tint(.black)
                    }
                    Divider()
                    HStack{
                        Text("Tyre").font(.system(size: 20 , weight: .medium, design: .rounded))
                        Toggle("", isOn: $isOnTyre)
                            .toggleStyle(.switch)
                            .tint(.black)
                    }
                    Divider()
                    HStack{
                        Text("Brake").font(.system(size: 20 , weight: .medium, design: .rounded))
                        Toggle("", isOn: $isOnBrake)
                            .toggleStyle(.switch)
                            .tint(.black)
                    }
                    Divider()
                    HStack{
                        Text("Battery").font(.system(size: 20 , weight: .medium, design: .rounded))
                        Toggle("", isOn: $isOnBattery)
                            .toggleStyle(.switch)
                            .tint(.black)
                    }
                    Divider()
                    
                    Text("Enter you car No.").font(.system(size: 20 ,weight: .light ,design: .serif))
                    TextField("Car Number", text: $carno).multilineTextAlignment(.center)
                        .padding()
                        .background(
                            Rectangle()
                                .fill(Color.gray.opacity(0.1))
                        )
                        .overlay(
                            Capsule()
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    Text("Problem Description").font(.system(size: 13 , weight: .black)).padding()
                    TextField("Write your Problem  here...", text: $paragraph, axis: .vertical)
                        .lineLimit(5...10) // min...max lines before scrolling
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    Divider()
                    Spacer()
                    NavigationLink {
                        CongatulationView()
                    } label: {
                        Text("Book").font(.system(size: 20 , weight: .medium , design: .serif)).foregroundColor(.black)
                    }.frame(width: 350 , height: 13).foregroundColor(.white)
                        .padding()
                        .background(
                            Capsule()
                                .glassEffect(.regular.tint(.blue.opacity(0.3)), in: .rect(cornerRadius: 20))
                                .onTapGesture {
                                   
                                }
                        )
                        
                }.padding()
                .frame(maxWidth: .infinity)
                
                
                
                
            }
        }
            
    }
}

#Preview {
    Requestservices()
}

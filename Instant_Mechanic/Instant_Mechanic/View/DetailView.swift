//
//  DetailView.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 01/09/26.
//

import SwiftUI

struct DetailView: View {
    let product: Task
    @State private var RequestService: Bool = false
    @State private var showModel: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack(alignment: .bottom){
                Color("HomeBackgroundColor")
                ScrollView(showsIndicators: false){
                    VStack(){
                        VStack(alignment: .leading){
                            HStack{
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color("transparentBlack"))
                                        .frame(width: 90, height: 40)
                                        .cornerRadius(20)
                                    
                                    Text("⭐️\(String(format: "%.1f", product.rating!))")
                                        .font(.system(size: 18, weight: .semibold)).foregroundColor(.black)
                                }
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(Color("transparentBlack"))
                                        .frame(width: 90, height: 40)
                                        .cornerRadius(20)
                                    
                                    Text(product.isOpen! ? "🟢Open" : "🔴Close"  )
                                        .font(.system(size: 18, weight: .semibold)).foregroundColor(.black)
                                }
                                
                            }.padding(.top , 60)
                                .padding(.horizontal)
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text(product.name!)
                                        .font(.system(size: 22 , weight: .heavy , design: .serif))
                                    Text("📍\(String(format:"%.1f" , product.distance!)) km").font(.system(size: 15 , weight: .semibold , design: .rounded)).foregroundStyle(.black)
                                        .padding(.bottom)
                                }.padding()
                                Spacer()
                                HStack{
                                    Image(product.image!).resizable().scaledToFit()
                                }.frame(width: 200)
                                
                            }
                        }
                        
                        VStack{
                            HStack(spacing: 80){
                                VStack{
                                    Text("\(product.experience!)Year").font(.system(size: 20 , weight: .semibold , design: .rounded))
                                    Text("Experience").font(.system(size: 15 , weight: .light , design: .rounded))
                                }
                                VStack{
                                    Text("\(product.noOfServices!)+").font(.system(size: 20 , weight: .semibold , design: .rounded))
                                    Text("Servies").font(.system(size: 15 , weight: .light , design: .rounded))
                                }
                                VStack{
                                    Text("\(product.noOfcars!)+").font(.system(size: 20 , weight: .semibold , design: .rounded))
                                    Text("Cars").font(.system(size: 15 , weight: .light , design: .rounded))
                                }
                            }.frame(width: 390, height: 100).glassEffect(.regular.tint(.gray.opacity(0.3)), in: .rect(cornerRadius: 20))
                            Text("About").font(.system(size: 30 , weight: .semibold , design: .rounded))
                        }.padding(.top, -5).cornerRadius(40)
                        VStack(alignment: .leading){
                            
                            Divider()
                            Text(product.description!).multilineTextAlignment(.center).font(.system(size: 20 , weight: .light , design: .rounded)).padding()
                            Text("Review & Ratings").font(.system(size: 30 , weight: .bold , design: .serif)).padding(.bottom)
                            HStack{
                                Text("\(String(format: "%.1f", product.rating!))").font(.system(size: 30 , weight: .bold , design: .serif)).padding()
                                Text(String(repeating: "⭐️", count: Int(product.rating ?? 0)))
                                    .font(.system(size: 30))
                            }
                            
                            Text("Services").font(.system(size: 30 , weight: .bold , design: .serif)).padding(.bottom).frame(maxWidth: .infinity, alignment: .center)
                            HStack{
                                if product.rating! > 4.5{
                                    Text("• Car Service").font(.system(size: 18, weight: .bold, design: .serif)).frame(maxWidth: .infinity, alignment: .center)
                                    Spacer()
                                    Text("• Battery").font(.system(size: 18, weight: .bold, design: .serif)).frame(maxWidth: .infinity, alignment: .center)
                                }
                            }.padding(.bottom , 4)
                            HStack{
                                Text("• AC Service").font(.system(size: 18, weight: .bold, design: .serif)).frame(maxWidth: .infinity, alignment: .center)
                                Spacer()
                                Text("• Tyer").font(.system(size: 18, weight: .bold, design: .serif)).frame(maxWidth: .infinity, alignment: .center)
                                
                            }
                            HStack(alignment: .center){
                                Spacer()
                                Text("[🗺️ Location -> ").font(.system(size: 19))
                                Text("\(product.location!)]").font(.system(size: 20))
                                Spacer()
                                
                            }.padding()
                            Text("-->Book your service now")
                            Divider()
                            
                        }
                        Spacer()
                    }
                    
                    
                    
                }
                Button {
                    showModel = true
                } label: {
                    Text("Request Service").font(.system(size: 20 , weight: .medium , design: .serif)).foregroundColor(.black)
                }.frame(width: 300 , height: 13).foregroundColor(.white)
                    .padding()
                    .background(
                        Capsule()
                            .glassEffect(.regular.tint(.gray.opacity(0.3)), in: .rect(cornerRadius: 20))
                            .onTapGesture {
                                
                            }
                    ).padding()
                
                
                
            }
            .navigationBarBackButtonHidden()
            .ignoresSafeArea()
            .sheet(isPresented: $showModel) {
                Requestservices()
            }
            
        }
        
        
        
    }
}

#Preview {
    DetailView(product: Task(
        product_id: 1,
        name: "Car Service",
        description: "Complete car service and maintenance",
        unit: "service",
        image: "image1",
        discount: 10,
        isOpen: true,
        rating: 4.7 ,
        location: "Delhi",
        distance: 2.5,
        experience: 12, noOfServices: 33 , noOfcars:20)
             )
}

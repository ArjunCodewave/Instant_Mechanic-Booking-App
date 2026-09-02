//
//  CardView.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 01/09/26.
//

import SwiftUI

struct CardView: View {
    let product: Task
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.homeBackground)
                VStack{
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
                        Spacer()
                    }.padding(.top, 20)
                        .padding(.horizontal)
                    Spacer()
                    HStack{
                        VStack(alignment: .leading){
                            Text(product.name!)
                                .font(.system(size: 22 , weight: .heavy , design: .serif))
                            Text("📍\(product.location!)").font(.system(size: 12 , weight: .semibold , design: .rounded)).foregroundStyle(.black)
                                .padding(.bottom)
                            Text("Service")
                                .font(.system(size: 15, weight: .bold, design: .serif)).padding(.bottom , 3)
                            HStack{
                                if product.rating! > 4.5{
                                    Text("• Car Service").font(.system(size: 8, weight: .bold, design: .serif))
                                    Text("• Battery").font(.system(size: 8, weight: .bold, design: .serif))
                                }
                                
                            }.padding(.bottom , 4)
                            HStack{
                                Text("• AC Service").font(.system(size: 8, weight: .bold, design: .serif))
                                Text("• Tyer").font(.system(size: 8, weight: .bold, design: .serif))
                                
                            }
                            
                            Spacer()
                                NavigationLink {
                                    DetailView(product: product)
                                } label: {
                                    HStack{
                                        Text("Book").fontDesign(.rounded).foregroundColor(.white)
                                        
                                    }
                                    
                                }.frame(width: 100 , height: 3).foregroundColor(.white)
                                    .padding()
                                    .background(
                                        Capsule()
                                            .fill(Color.black)
                                            .onTapGesture {
                                                
                                            }
                                    )
                            
                        }.padding()
                        HStack{
                            Image("\(product.image!)").resizable().scaledToFit()
                        }.frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.leading)
                        
                    }
                }
            }.frame(minWidth: 200, idealWidth: 390, maxWidth: 390,
                    minHeight: 150, idealHeight: 290, maxHeight: 290).cornerRadius(45)
                
        }
    }
}

#Preview {
    CardView(product:  Task(
        product_id: 1,
        name: "Car Service",
        description: "Complete car service and maintenance",
        unit: "service",
        image: "image1",
        discount: 10,
        isOpen: true,
        rating: 12,
        location: "Delhi",
        distance: 4.7,
        experience: 12, noOfServices: 33 , noOfcars:20)
             )
}

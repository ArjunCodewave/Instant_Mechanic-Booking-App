//
//  ContentView.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 01/09/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ProductViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.white).ignoresSafeArea()
                VStack(alignment: .leading){
                    Group{
                        Text("Choose").font(.system(size: 19 , design: .none))
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black , .gray]), startPoint: .top, endPoint: .bottom))
                        
                        Text("Mechanic").font(.system(size: 35 , weight: .bold, design: .serif)).lineLimit(1)
                    }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading)
                    
                    Spacer()
                    ScrollView(.vertical , showsIndicators: false){
                        VStack(spacing: 20) {
                            SearchTextField(searchText: $vm.searchText).padding()
                            ForEach(vm.filteredProducts) { product in
                                CardView(product: product).padding(Edge.Set.leading, 5)
                            }
                        }
                        
                    }
                    
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

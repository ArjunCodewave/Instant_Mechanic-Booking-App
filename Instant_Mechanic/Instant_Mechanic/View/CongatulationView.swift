//
//  CongatulationView.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 02/09/26.
//

import SwiftUI

struct CongatulationView: View {
    var body: some View {
        ZStack{
            Color("laskscrrenbg").ignoresSafeArea()
            VStack{
                Text("Service request submitted successfully.").font(.system(size: 20 , weight: .bold , design: .serif))
                Text("👍🏻").font(.system(size: 50)).padding()
                Text("we will connect soon")
            }
        }
        
    }
}

#Preview {
    CongatulationView()
}

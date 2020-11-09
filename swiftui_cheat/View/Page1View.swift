//
//  Page1View.swift
//  swiftui_cheat
//
//  Created by 宮本光直 on 2021/10/02.
//

import SwiftUI

struct Page1View: View {
    var body: some View {
        
        VStack{
            NavigationLink(destination: AlerView()) {
                Text("Alert")
            }
            
            Spacer().frame(height: 30)
            
            NavigationLink(destination: CardView()) {
                Text("Card")
            }
        }
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}

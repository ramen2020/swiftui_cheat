//
//  Page1View.swift
//  swiftui_cheat
//
//  Created by 宮本光直 on 2021/10/02.
//

import SwiftUI

struct Page1View: View {
    var body: some View {
        NavigationLink(destination: AlerView()) {
            Text("Alert")
        }
    }
}

struct Page1View_Previews: PreviewProvider {
    static var previews: some View {
        Page1View()
    }
}

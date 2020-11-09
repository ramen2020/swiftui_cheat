//
//  CardView.swift
//  swiftui_cheat
//
//  Created by 宮本光直 on 2021/10/02.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                Text("コーヒー")
                    .font(.system(size: 18, weight: .semibold, design: .default))
                Text("For breakfast today, I had some bread and a cup of coffee. I had a hard time deciding whether to drink café au lait or black coffee, so I went with black coffee.")
                    .font(.system(size: 14, design: .default))
            }
        }
        .frame(width: 300, height: 500, alignment: .center)
        .background(Color.blue)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

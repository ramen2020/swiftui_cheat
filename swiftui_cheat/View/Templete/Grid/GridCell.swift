//
//  GridCell
//  swiftui_cheat
//

import SwiftUI

struct GridCell: View {
    var person: GridStruct
    
    var body: some View {
        VStack() {
            Image(person.imageName)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .primary, radius: 5)
                .padding([.horizontal, .top], 7)
            Text(person.title).lineLimit(1)
            Text(person.subTitle).lineLimit(1)
        }
    }
}


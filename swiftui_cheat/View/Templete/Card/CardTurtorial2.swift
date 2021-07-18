//
//  CardTurtorial2
//  swiftui_cheat
//

import SwiftUI

struct CardTurtorial2: View {
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 0) {
                Image(systemName: "airplane.circle")
                Text("機内モード")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color.red)
            .frame(width: 200, height: 100, alignment: .leading)
            .background(Color.black)
            .cornerRadius(6)
            .shadow(color: Color.gray, radius: 5)
        }
    }
}

struct CardTurtorial2_Previews: PreviewProvider {
    static var previews: some View {
        CardTurtorial2()
    }
}

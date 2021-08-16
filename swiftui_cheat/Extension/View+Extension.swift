//
//  View+Extension
//  swiftui_cheat
//

import SwiftUI

// black Mask
extension View {
    @ViewBuilder
    func onMask(isMask: Bool, text: String = "") -> some View {
        if isMask {
            self
                .overlay(
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.5))
                                .frame(width: geo.size.width)
                                .cornerRadius(4)
                            Text(text)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
                )
        } else {
            self
        }
    }
}

//
//  View+Extension
//  swiftui_cheat
//

import SwiftUI

// black Mask
extension View {
    @ViewBuilder
    func onBlackFilter(
        isFilter: Bool,
        color: Color = Color.black.opacity(0.6),
        text: String = ""
    ) -> some View {
        if isFilter {
            self
                .overlay(
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(color)
                            .cornerRadius(4)
                        Text(text)
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                )
        } else {
            self
        }
    }
}

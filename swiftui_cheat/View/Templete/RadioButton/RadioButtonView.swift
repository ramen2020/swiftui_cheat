//
//  RadioButtonView
//  swiftui_cheat
//

import SwiftUI

struct RadioButtonView: View {
    
    @State private var selectedIndex = 0

    let breakfastTexts = ["パン", "おにぎり", "食べない", "その他"]

    var body: some View {
        VStack {
            Text("・ 朝食は何を食べますか？")
                .frame(maxWidth: .infinity, alignment: .leading)
            RadioButton(selectedIndex: $selectedIndex, axis: .horizontal, texts: breakfastTexts)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal, 10)

    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonView()
    }
}

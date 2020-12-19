//
//  RadioButtonView
//  swiftui_cheat
//

import SwiftUI

struct RadioButtonView: View {
    
    @State private var selectedBreakfastIndex = 0
    @State private var selectedLanguageIndex = 0

    let breakfastTexts = ["パン", "おにぎり", "その他"]
    let languageTexts = ["Flutter", "Swift", "Kotlin", "その他"]

    var body: some View {
        VStack(spacing: 30) {
            VStack {
                Text("・ 朝食は何を食べますか？")
                    .frame(maxWidth: .infinity, alignment: .leading)
                RadioButton(selectedIndex: $selectedBreakfastIndex, axis: .horizontal, texts: breakfastTexts)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack {
                Text("・ 好きな言語は何ですか？")
                    .frame(maxWidth: .infinity, alignment: .leading)
                RadioButton(selectedIndex: $selectedLanguageIndex, axis: .vertical, texts: languageTexts)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct RadioButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonView()
    }
}

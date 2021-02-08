//
//  LazyVGridView
//  swiftui_cheat
//

import SwiftUI

struct LazyVGridView: View {
    
    let stubDatas: [GridStruct] = [
        GridStruct(id: 1, title: "お知らせ", subTitle: "誕生日です。", imageName: "animal_arupaka"),
        GridStruct(id: 2, title: "イベント情報", subTitle: "半額セール！", imageName: "animal_buta"),
        GridStruct(id: 3, title: "キャンペーン", subTitle: "友達割引！！", imageName: "animal_neko"),
        GridStruct(id: 4, title: "お知らせ", subTitle: "バーゲン！", imageName: "animal_penguin")
    ]
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 200))]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(stubDatas) { person in
                GridCell(person: person)
            }
        }
        .padding()
    }
}

struct LazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridView()
    }
}

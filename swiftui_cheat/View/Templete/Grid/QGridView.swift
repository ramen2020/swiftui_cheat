//
//  QGeidView
//  swiftui_cheat
//

import SwiftUI
import QGrid

struct QGridView: View {
    
    let stubDatas: [GridStruct] = [
        GridStruct(id: 1, title: "お知らせ", subTitle: "誕生日です。", imageName: "animal_arupaka"),
        GridStruct(id: 2, title: "イベント情報", subTitle: "半額セール！", imageName: "animal_buta"),
        GridStruct(id: 3, title: "キャンペーン", subTitle: "友達割引！！", imageName: "animal_neko"),
        GridStruct(id: 4, title: "お知らせ", subTitle: "バーゲン！", imageName: "animal_penguin")
    ]

    var body: some View {
        VStack {
            QGrid(stubDatas, columns: 3) { data in
                GridCell(person: data)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.materialColor(colorCode: .purple))
        .background(Color.materialColor(colorCode: .lightBlue))
        .navigationBarTitle("QGrid", displayMode:.large)
    }
}

struct QGridView_Previews: PreviewProvider {
    static var previews: some View {
        QGridView()
    }
}

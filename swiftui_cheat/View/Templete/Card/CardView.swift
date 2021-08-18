import SwiftUI

struct CardView: View {
    
    var body: some View {
        VStack {
            Card1()
                .onBlackFilter(isFilter: true)
                .padding(30)
            
            ForEach(0..<2) { index in
                Card1()
                    .onBlackFilter(isFilter: (index == 1), text: "on mask")
                    .padding(30)
             }
        }
    }
}
//
//struct CardView_Previews: PreviewProvider {
//    static var scrum = DailyScrum.data[0]
//    static var previews: some View {
//        CardView()
//            .background(scrum.color)
//            .previewLayout(.fixed(width: 400, height: 60))
//    }
//}
//


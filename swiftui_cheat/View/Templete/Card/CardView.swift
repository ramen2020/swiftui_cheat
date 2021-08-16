import SwiftUI

struct CardView: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer().frame(height: 30)
                CardTurtorial1()
                CardTurtorial2()
                Card1()
                Card2()
                Card2()
                    .onMask(isMask: true)
                Card2()
                    .padding(20)
                Card2()
                    .onMask(isMask: true, text: "mask")
                        .padding(20)

            }
            .frame(maxWidth: .infinity)
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .navigationBarTitle("Card", displayMode: .large)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.data[0]
    static var previews: some View {
        CardView()
            .background(scrum.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}



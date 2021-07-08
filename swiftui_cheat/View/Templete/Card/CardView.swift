import SwiftUI

struct CardView: View {
    
    var body: some View {
        ScrollView {
            CardTurtorial1()
            Card1()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .navigationBarTitle("Card", displayMode:.large)
    }
}

struct DailyScrum {
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color.red),
        ]
    }
}


struct CardTurtorial1: View {
    let scrum = DailyScrum.data[0]
    var body: some View {
        VStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text(scrum.title)
                    .font(.headline)
                Spacer()
                HStack {
                    Label("\(scrum.attendees.count)", systemImage: "person.3")
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(Text("Attendees"))
                        .accessibilityValue(Text("\(scrum.attendees.count)"))
                    Spacer()
                    Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                        .padding(.trailing, 20)
                }
                .font(.caption)
            }
            .frame(width: 200, height: 100)
            .padding()
            .foregroundColor(scrum.color)
            .background(Color.black)
            
            HStack(spacing: 0) {
                Image(systemName: "airplane.circle")
                Text("機内モード")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color.red)
            .frame(width: 200, height: 100, alignment: .leading)
            .background(Color.black)
        }
    }
}

struct Card1: View {
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color.yellow)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue)
                
                VStack(spacing: 8) {
                    Text("こんにちわ")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("おやすみ")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color.white)
                        .frame(width: 120, height: 30)
                        .background(Color.pink)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .cornerRadius(6)
                    
                }
                .foregroundColor(Color.black)
                .padding(10)
                .background(Color.white)
            }
            .frame(width: 200, height: 170)
            .background(Color.white)
            .clipped()
            .cornerRadius(6)
            .shadow(color: Color.gray, radius: 5)
        }
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



import SwiftUI

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

struct CardView: View {
    let scrum = DailyScrum.data[0]
    var body: some View {
        VStack{
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
        }
        .navigationBarTitle("Card", displayMode:.large)
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


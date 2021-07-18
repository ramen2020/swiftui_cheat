//
//  CardTurtorial1
//  swiftui_cheat
//

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
            .cornerRadius(6)
            .shadow(color: Color.gray, radius: 5)
        }
    }
}

struct CardTurtorial1_Previews: PreviewProvider {
    static var previews: some View {
        CardTurtorial1()
    }
}

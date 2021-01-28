/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
 
 Link: https://developer.apple.com/tutorials/swiftui/handling-user-input
*/

import SwiftUI

struct HandlingUserInputLandmarkList: View {
    @EnvironmentObject var modelData: HandlingUserInputModelData
    @State private var showFavoritesOnly = false

    var filteredLandmarks: [HandlingUserInputLandmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(destination: HandlingUserInputLandmarkDetail(landmark: landmark)) {
                        HandlingUserInputLandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct HandlingUserInputLandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        HandlingUserInputLandmarkList()
            .environmentObject(HandlingUserInputModelData())
    }
}

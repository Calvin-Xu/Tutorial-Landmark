//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Calvin Xu on 6/11/20.
//  Copyright © 2020 Calvin Xu. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(
                        destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData)
                    ) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            NavigationView {
                LandmarkList()
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}

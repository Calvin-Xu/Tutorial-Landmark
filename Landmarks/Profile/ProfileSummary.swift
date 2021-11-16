//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Calvin Xu on 6/13/20.
//  Copyright © 2020 Calvin Xu. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    static let goalFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    // essentially defining a closure here and immediately calling it
    // if you don't have the (), you have a **closure** that returns a DateFormatter, instead of a DateFormatter!!!
    
    var body: some View {
        List {
            Text(profile.username)
                .bold()
                .font(.title)
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On": "Off" )")
            
            Text("Seasonal Photos: \(self.profile.seasonalPhoto.rawValue)")
            
            Text("Goal Date: \(self.profile.goalDate, formatter: Self.goalFormat)")
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(.init(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .hueRotation(.init(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            VStack(alignment: .leading) {
                Text("Recent Hikes")
                    .font(.headline)
                
                HikeView(hike: hikeData[0])
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}

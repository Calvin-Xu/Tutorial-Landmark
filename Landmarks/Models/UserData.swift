//
//  UserData.swift
//  Landmarks
//
//  Created by Calvin Xu on 6/11/20.
//  Copyright © 2020 Calvin Xu. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}

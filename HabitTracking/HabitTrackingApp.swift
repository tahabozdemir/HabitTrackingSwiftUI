//
//  HabitTrackingApp.swift
//  HabitTracking
//
//  Created by Taha Bozdemir on 7.07.2022.
//

import SwiftUI

@main
struct HabitTrackingApp: App {
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(red: 0.37, green: 0.82, blue: 0.41, alpha: 1)]
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

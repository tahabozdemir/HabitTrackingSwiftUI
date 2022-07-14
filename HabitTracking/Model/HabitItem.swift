//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Taha Bozdemir on 10.07.2022.
//
import Foundation
struct HabitItem: Identifiable,Codable,Equatable{
    var id = UUID()
    let habitName: String
    let habitDescription: String
    let habitDate:Date
    var habitCompletionCount: Int{
        didSet{
            if habitCompletionCount < 0 {
                habitCompletionCount = 0
            }
        }
    }
}

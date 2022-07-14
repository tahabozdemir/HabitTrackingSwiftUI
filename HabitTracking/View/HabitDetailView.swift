//
//  HabitDetailView.swift
//  HabitTracking
//
//  Created by Taha Bozdemir on 10.07.2022.
//
import SwiftUI
struct HabitDetailView: View {
    @State var habit: HabitItem
    @ObservedObject var habits: Habits
    let colums = [GridItem(.adaptive(minimum: 5))]
    var body: some View {
        GeometryReader{ geo in
            VStack{
                Form{
                    Group{
                        Section("Habit Name") {
                            Text(habit.habitName)
                        }
                        Section("Habit Description") {
                            Text(habit.habitDescription)
                        }
                        Section("Habit Started Date") {
                            Text("\(habit.habitDate.formatted(date: .abbreviated, time: .omitted))")
                        }
                        Section("Habit Progress"){
                            ZStack {
                                LazyVGrid(columns: colums){
                                    ForEach(0..<habit.habitCompletionCount, id: \.self){ item in
                                        Rectangle()
                                            .fill(.colorDarkGreen)
                                            .frame(width: 10, height: 10)
                                    }
                                }
                                .frame(width: geo.size.width - 60, height: 120, alignment: .topLeading)
                            }
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                        .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
                        Section("Habit Completion Count"){
                            Stepper("\(habit.habitCompletionCount)") {
                                habit.habitCompletionCount += 1
                                save()
                            } onDecrement: {
                                habit.habitCompletionCount -= 1
                                save()
                            }
                        }
                    }
                    .listRowBackground(Color.colorYellow)
                }
                .foregroundColor(Color.colorDarkGreen)
                .background(.white)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                .onDisappear {
                    UITableView.appearance().backgroundColor = .systemGroupedBackground
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    func save(){
        guard let index = habits.items.firstIndex(where: {$0.id == habit.id }) else { return }
        habits.items[index].habitCompletionCount = habit.habitCompletionCount
    }
    
}


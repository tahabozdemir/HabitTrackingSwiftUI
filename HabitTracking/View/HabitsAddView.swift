//
//  Habits.swift
//  HabitTracking
//
//  Created by Taha Bozdemir on 10.07.2022.
//
import SwiftUI
struct HabitsAddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var habitName = ""
    @State private var habitDescription = ""
    @State private var habitDate:Date = Date.now
    @ObservedObject var habits: Habits
    @State private var showingAlert = false
    var body: some View {
        NavigationView{
            Form{
                Group{
                    Section("Habit Name") {
                        TextField("Habit", text: $habitName)
                    }
                    Section("Habit Description") {
                        TextField("Description", text: $habitDescription)
                    }
                    Section("Habit Started Date") {
                        DatePicker("I started on", selection: $habitDate, displayedComponents: [.date])
                            .accentColor(.colorGrenn)
                    }
                }
                .listRowBackground(Color.colorYellow)
            }
            .foregroundColor(Color.colorDarkGreen)
            .background(.white)
            .navigationTitle("Add Habit")
            .toolbar {
                Button("Save"){
                    saveHabit()
                }
                .foregroundColor(Color.colorGrenn)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
            .onDisappear {
                UITableView.appearance().backgroundColor = .systemGroupedBackground
            }
            .alert("Could not add habit", isPresented: $showingAlert){
                Button("OK"){showingAlert = false}
            } message: {
                Text("Please make sure you have filled out habit name before proceeding.")
            }
        }
    }
    func saveHabit() {
        if (habitName != "") {
            let item = HabitItem(habitName: self.habitName, habitDescription: self.habitDescription, habitDate: self.habitDate, habitCompletionCount: 0)
            self.habits.items.insert(item, at: 0)
            self.dismiss()
            return
        } else {
            showingAlert = true
            return
        }
    }
}
struct HabitsAddView_Previews: PreviewProvider {
    static var previews: some View {
        HabitsAddView(habits: Habits())
    }
}

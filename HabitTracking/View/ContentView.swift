//
//  ContentView.swift
//  HabitTracking
//
//  Created by Taha Bozdemir on 10.07.2022.
//
import SwiftUI
struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showingAddHabit = false
    var body: some View {
        GeometryReader { geo in
            NavigationView{
                List{
                    ForEach(habits.items) { habit in
                        NavigationLink{
                            HabitDetailView(habit: habit, habits: habits)
                        }label:{
                            HStack{
                                VStack{
                                    Text("\(habit.habitName)")
                                        .font(.title2)
                                    Text("\(habit.habitDate.formatted(date: .abbreviated, time: .omitted))")
                                        .font(.caption)
                                }
                                .padding([.leading])
                                Spacer()
                                Text("\(habit.habitCompletionCount)")
                                    .bold()
                                    .padding([.trailing])
                                
                            }
                            .foregroundColor(.white)
                            .frame(width: geo.size.width - 50, height: 100, alignment: .center)
                            .background(LinearGradient(gradient: Gradient(colors: [.colorGrenn,.colorYellow]), startPoint: .top, endPoint: .bottom))
                            .cornerRadius(25)
                        }
                    }
                    .onDelete(perform: removeItems)
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Habit Tracker")
                .toolbar {
                    Button{
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.colorGrenn)
                    }
                }
            }
            .preferredColorScheme(.light)
            .accentColor(.colorGrenn)
            .sheet(isPresented: $showingAddHabit) {
                HabitsAddView(habits: habits)
            }
        }
    }
    func removeItems(at offsets: IndexSet){
        habits.items.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


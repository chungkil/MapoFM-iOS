//
//  ScheduleView.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//

import SwiftUI

struct ScheduleView: View {
    var schedule: Schedule = Schedule()
    
    @State var selectedDay: DayOfWeek = .monday
    
    var programsForDay: [Program] {
        schedule.programs.filter {
            $0.dayOfWeek == selectedDay
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Flavor", selection: $selectedDay) {
                    ForEach(DayOfWeek.allCases, id: \.self) { day in
                        Text("\(day.rawValue)").tag(day)
                    }
                }
                .pickerStyle(.segmented)
                
                List {
                    Grid(alignment: .leading, verticalSpacing: 12) {
                        ForEach(programsForDay) { program in
                            GridRow {
                                Text(program.startTimeString)
                                    .font(.caption)
                                LazyHStack {
                                    Text(program.name)
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("편성표")
            .onAppear {
                selectedDay = DayOfWeek.currentDayOfWeek() ?? .monday
            }
        }
    }
}

#Preview {
    ScheduleView()
}

//
//  DayOfWeek.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/27/25.
//


import Foundation

enum DayOfWeek: String, CaseIterable {
    case monday = "월"
    case tuesday = "화"
    case wednesday = "수"
    case thursday = "목"
    case friday = "금"
    case saturday = "토"
    case sunday = "일"
    
    static func currentDayOfWeek() -> DayOfWeek? {
        let today = Date()
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: today)
        
        // Calendar에서 Sunday가 1, Monday가 2, ... , Saturday가 7이므로 매핑합니다.
        switch weekday {
        case 2:
            return .monday
        case 3:
            return .tuesday
        case 4:
            return .wednesday
        case 5:
            return .thursday
        case 6:
            return .friday
        case 7:
            return .saturday
        case 1:
            return .sunday
        default:
            return nil
        }
    }
}

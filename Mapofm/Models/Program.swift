//
//  Program.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//
import Foundation

struct Program: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String?
    var dayOfWeek: DayOfWeek
    var startAt: String
    var endAt: String
    var imageURLString: String?
    
    var startTimeString: String {
        convertTimeString(startAt)
    }
    
    var endTimeString: String {
        convertTimeString(endAt)
    }
    
    /// "HH:mm" 형식의 문자열을 받아 "오전/오후 h:mm" 형태로 변환하는 함수
    private func convertTimeString(_ timeString: String) -> String {
        // 입력 값이 "HH:mm" 형태인지 검사
        let parts = timeString.split(separator: ":")
        guard parts.count == 2,
        let hour24 = Int(parts[0]),
        let minute = Int(parts[1]) else {
        return timeString
        }
        let period: String
        let hour12: Int

        if hour24 == 0 {
            period = "오전"
            hour12 = 12
        } else if hour24 < 12 {
            period = "오전"
            hour12 = hour24
        } else if hour24 == 12 {
            period = "오후"
            hour12 = 12
        } else {
            period = "오후"
            hour12 = hour24 - 12
        }

        let minuteString = String(format: "%02d", minute)
        return "\(period) \(hour12):\(minuteString)"

    }
}

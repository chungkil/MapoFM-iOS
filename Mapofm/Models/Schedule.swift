//
//  Schedule.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//
import Foundation

struct Schedule {
    var programs: [Program] = []
    
    var currentProgram: Program? {
        
        let todayOfWeek = DayOfWeek.currentDayOfWeek()
        
        // 현재 시각 구하기 (기준날짜 포함)
        let now = Date()
        
        // 현재 요일에 맞는 프로그램만 필터링
        let todaysPrograms = programs.filter { $0.dayOfWeek == todayOfWeek }
        
        // startAt 시간을 Date로 변환하여, 현재 시각보다 같거나 작은 것들을 찾습니다.
        // 여러 항목이 있으면 시작시간이 가장 늦은 항목 선택
        var currentProgram: Program? = nil
        var latestStartDate: Date? = nil
        
        
        for program in todaysPrograms {
            if let programStartDate = dateFromTimeString(program.startAt) {
                // 현재시각보다 같거나 이전 시간이라면
                if programStartDate <= now {
                    if let latest = latestStartDate {
                        if programStartDate > latest {
                            latestStartDate = programStartDate
                            currentProgram = program
                        }
                    } else {
                        latestStartDate = programStartDate
                        currentProgram = program
                    }
                }
            } else {
                print("시간 형식 변환 실패: \(program.startAt)")
            }
        }
        
        return currentProgram
    }
    
    init() {
        programs = [
            Program(name: "정파시간", dayOfWeek: .monday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .monday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .monday, startAt: "07:30", endAt: "08:52"),
            Program(name: "마포투데이", dayOfWeek: .monday, startAt: "08:52", endAt: "09:00"),
            Program(name: "송덕호의 마포속으로", dayOfWeek: .monday, startAt: "09:00", endAt: "10:00"),
            Program(name: "작전명 한글", dayOfWeek: .monday, startAt: "10:00", endAt: "11:00"),
            Program(name: "마지막 포대기", dayOfWeek: .monday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고", dayOfWeek: .monday, startAt: "12:00", endAt: "14:00"),
            Program(name: "송덕호의 마포속으로(재)", dayOfWeek: .monday, startAt: "14:00", endAt: "15:00"),
            Program(name: "아스카의 동심연구소(재)", dayOfWeek: .monday, startAt: "15:00", endAt: "16:00"),
            Program(name: "BGM", dayOfWeek: .monday, startAt: "16:00", endAt: "17:00"),
            Program(name: "투데이매거진", dayOfWeek: .monday, startAt: "17:00", endAt: "18:00"),
            Program(name: "송덕호의 마포속으로(삼)", dayOfWeek: .monday, startAt: "18:00", endAt: "19:00"),
            Program(name: "왁자지껄0020[중앙대 청충앙]", dayOfWeek: .monday, startAt: "19:00", endAt: "20:00"),
            Program(name: "스틸얼라이브", dayOfWeek: .monday, startAt: "20:00", endAt: "22:00"),
            Program(name: "DJ민수의 조선등신사", dayOfWeek: .monday, startAt: "22:00", endAt: "23:00"),
            Program(name: "뮤직홍[시나쓰는 엘리스와 동네음악가]", dayOfWeek: .monday, startAt: "23:00", endAt: "24:00"),
            
            Program(name: "정파시간", dayOfWeek: .tuesday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .tuesday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .tuesday, startAt: "07:30", endAt: "08:52"),
            Program(name: "마포투데이", dayOfWeek: .tuesday, startAt: "08:52", endAt: "09:00"),
            Program(name: "송덕호의 마포속으로", dayOfWeek: .tuesday, startAt: "09:00", endAt: "10:00"),
            Program(name: "우리들의 마흔", dayOfWeek: .tuesday, startAt: "10:00", endAt: "11:00"),
            Program(name: "소금마음수다방(격)", dayOfWeek: .tuesday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고", dayOfWeek: .tuesday, startAt: "12:00", endAt: "14:00"),
            Program(name: "송덕호의 마포속으로(재)", dayOfWeek: .tuesday, startAt: "14:00", endAt: "15:00"),
            Program(name: "BGM", dayOfWeek: .tuesday, startAt: "15:00", endAt: "16:00"),
            Program(name: "BGM", dayOfWeek: .tuesday, startAt: "16:00", endAt: "17:00"),
            Program(name: "투데이메거진(재)", dayOfWeek: .tuesday, startAt: "17:00", endAt: "18:00"),
            Program(name: "송덕호의 마포속으로(삼)", dayOfWeek: .tuesday, startAt: "18:00", endAt: "19:00"),
            Program(name: "왁자지껄0020[서강대 서라운드]", dayOfWeek: .tuesday, startAt: "19:00", endAt: "20:00"),
            Program(name: "블록킹(재)", dayOfWeek: .tuesday, startAt: "20:00", endAt: "21:00"),
            Program(name: "헤라디어", dayOfWeek: .tuesday, startAt: "21:00", endAt: "22:00"),
            Program(name: "음악의 계절", dayOfWeek: .tuesday, startAt: "22:00", endAt: "23:00"),
            Program(name: "뮤직홍[야심한밤 이후민입니다]", dayOfWeek: .tuesday, startAt: "23:00", endAt: "24:00"),
            
            Program(name: "정파시간", dayOfWeek: .wednesday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .wednesday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .wednesday, startAt: "07:30", endAt: "08:52"),
            Program(name: "마포투데이", dayOfWeek: .wednesday, startAt: "08:52", endAt: "09:00"),
            Program(name: "송덕호의 마포속으로", dayOfWeek: .wednesday, startAt: "09:00", endAt: "10:00"),
            Program(name: "마포문화의 맥을 짚다", dayOfWeek: .wednesday, startAt: "10:00", endAt: "11:00"),
            Program(name: "작전명 한글(재)", dayOfWeek: .wednesday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고", dayOfWeek: .wednesday, startAt: "12:00", endAt: "14:00"),
            Program(name: "송덕호의 마포속으로(재)", dayOfWeek: .wednesday, startAt: "14:00", endAt: "15:00"),
            Program(name: "BGM", dayOfWeek: .wednesday, startAt: "15:00", endAt: "16:00"),
            Program(name: "BGM", dayOfWeek: .wednesday, startAt: "16:00", endAt: "17:00"),
            Program(name: "투데이메거진", dayOfWeek: .wednesday, startAt: "17:00", endAt: "18:00"),
            Program(name: "송덕호의 마포속으로(삼)", dayOfWeek: .wednesday, startAt: "18:00", endAt: "19:00"),
            Program(name: "이불밖은 안위험해", dayOfWeek: .wednesday, startAt: "19:00", endAt: "20:00"),
            Program(name: "아날로그 온", dayOfWeek: .wednesday, startAt: "20:00", endAt: "21:00"),
            Program(name: "L양장점", dayOfWeek: .wednesday, startAt: "21:00", endAt: "23:00"),
            Program(name: "뮤직홍[바람종의 바람그리기]", dayOfWeek: .wednesday, startAt: "23:00", endAt: "24:00"),
            
            Program(name: "정파시간", dayOfWeek: .thursday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .thursday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .thursday, startAt: "07:30", endAt: "08:52"),
            Program(name: "마포투데이", dayOfWeek: .thursday, startAt: "08:52", endAt: "09:00"),
            Program(name: "송덕호의 마포속으로", dayOfWeek: .thursday, startAt: "09:00", endAt: "10:00"),
            Program(name: "세상에 이런 JOB이", dayOfWeek: .thursday, startAt: "10:00", endAt: "11:00"),
            Program(name: "어쩌다 합정러(격)", dayOfWeek: .thursday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고", dayOfWeek: .thursday, startAt: "12:00", endAt: "14:00"),
            Program(name: "송덕호의 마포속으로(재)", dayOfWeek: .thursday, startAt: "14:00", endAt: "15:00"),
            Program(name: "BGM", dayOfWeek: .thursday, startAt: "15:00", endAt: "16:00"),
            Program(name: "BGM", dayOfWeek: .thursday, startAt: "16:00", endAt: "17:00"),
            Program(name: "투데이메거진(재)", dayOfWeek: .thursday, startAt: "17:00", endAt: "18:00"),
            Program(name: "송덕호의 마포속으로(삼)", dayOfWeek: .thursday, startAt: "18:00", endAt: "19:00"),
            Program(name: "왁자지껄0020[숙명여대 눈설미]", dayOfWeek: .thursday, startAt: "19:00", endAt: "20:00"),
            Program(name: "알쓸맥잡", dayOfWeek: .thursday, startAt: "20:00", endAt: "21:00"),
            Program(name: "헤라디어(재)", dayOfWeek: .thursday, startAt: "21:00", endAt: "22:00"),
            Program(name: "불멸의 탱고음악(격)", dayOfWeek: .thursday, startAt: "22:00", endAt: "23:00"),
            Program(name: "뮤직홍[체셔의 밤 라디오]", dayOfWeek: .thursday, startAt: "23:00", endAt: "24:00"),
            
            Program(name: "정파시간", dayOfWeek: .friday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .friday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .friday, startAt: "07:30", endAt: "08:52"),
            Program(name: "마포투데이", dayOfWeek: .friday, startAt: "08:52", endAt: "09:00"),
            Program(name: "송덕호의 마포속으로", dayOfWeek: .friday, startAt: "09:00", endAt: "10:00"),
            Program(name: "비건먼지 비건토크(격)", dayOfWeek: .friday, startAt: "10:00", endAt: "11:00"),
            Program(name: "골목한쪽", dayOfWeek: .friday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고", dayOfWeek: .friday, startAt: "12:00", endAt: "14:00"),
            Program(name: "송덕호의 마포속으로(재)", dayOfWeek: .friday, startAt: "14:00", endAt: "15:00"),
            Program(name: "아스카의 동심연구소", dayOfWeek: .friday, startAt: "15:00", endAt: "16:00"),
            Program(name: "BGM", dayOfWeek: .friday, startAt: "16:00", endAt: "17:00"),
            Program(name: "투데이메거진(재)", dayOfWeek: .friday, startAt: "17:00", endAt: "18:00"),
            Program(name: "송덕호의 마포속으로(삼)", dayOfWeek: .friday, startAt: "18:00", endAt: "19:00"),
            Program(name: "왁자지껄0020(격)[이화여대 프렌디오]", dayOfWeek: .friday, startAt: "19:00", endAt: "20:00"),
            Program(name: "블록킹", dayOfWeek: .friday, startAt: "20:00", endAt: "21:00"),
            Program(name: "DJ민수의 조선통신사(재)", dayOfWeek: .friday, startAt: "21:00", endAt: "22:00"),
            Program(name: "음악의 계절(재)", dayOfWeek: .friday, startAt: "22:00", endAt: "23:00"),
            Program(name: "BGM", dayOfWeek: .friday, startAt: "23:00", endAt: "24:00"),
            
            Program(name: "정파시간", dayOfWeek: .saturday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .saturday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .saturday, startAt: "07:30", endAt: "08:52"),
            Program(name: "김모씨의 주간날씨", dayOfWeek: .saturday, startAt: "08:52", endAt: "09:00"),
            Program(name: "주말 마포속으로(재)", dayOfWeek: .saturday, startAt: "09:00", endAt: "10:00"),
            Program(name: "마포문화의 맥을 짚다(재)", dayOfWeek: .saturday, startAt: "10:00", endAt: "11:00"),
            Program(name: "마지막 포대기(재)", dayOfWeek: .saturday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고(월)", dayOfWeek: .saturday, startAt: "12:00", endAt: "14:00"),
            Program(name: "복고복고(화)", dayOfWeek: .saturday, startAt: "14:00", endAt: "16:00"),
            Program(name: "50+ 등등수다/영화(격)", dayOfWeek: .saturday, startAt: "16:00", endAt: "17:00"),
            Program(name: "50+ 힐링을 부탁해(격)", dayOfWeek: .saturday, startAt: "17:00", endAt: "18:00"),
            Program(name: "주말 마포속으로(재)", dayOfWeek: .saturday, startAt: "18:00", endAt: "19:00"),
            Program(name: "이블박은 안위험해(재)", dayOfWeek: .saturday, startAt: "19:00", endAt: "20:00"),
            Program(name: "아날로그 온(재)", dayOfWeek: .saturday, startAt: "20:00", endAt: "21:00"),
            Program(name: "스틸얼라이브(재)", dayOfWeek: .saturday, startAt: "21:00", endAt: "23:00"),
            Program(name: "뮤직홍[한받의 한밤의 음악폭동]", dayOfWeek: .saturday, startAt: "23:00", endAt: "24:00"),
            
            Program(name: "정파시간", dayOfWeek: .sunday, startAt: "00:00", endAt: "07:00"),
            Program(name: "뮤직홍(재)", dayOfWeek: .sunday, startAt: "07:00", endAt: "07:30"),
            Program(name: "아침을 여는 음악 (BGM)", dayOfWeek: .sunday, startAt: "07:30", endAt: "08:52"),
            Program(name: "김모씨의 주간날씨", dayOfWeek: .sunday, startAt: "08:52", endAt: "09:00"),
            Program(name: "주말 마포속으로(재)", dayOfWeek: .sunday, startAt: "09:00", endAt: "10:00"),
            Program(name: "우리들의 마흔(재)", dayOfWeek: .sunday, startAt: "10:00", endAt: "11:00"),
            Program(name: "세상에 이런 JOB이(재)", dayOfWeek: .sunday, startAt: "11:00", endAt: "12:00"),
            Program(name: "복고복고(수)", dayOfWeek: .sunday, startAt: "12:00", endAt: "14:00"),
            Program(name: "복고복고(목)", dayOfWeek: .sunday, startAt: "14:00", endAt: "16:00"),
            Program(name: "복고복고(금)", dayOfWeek: .sunday, startAt: "16:00", endAt: "18:00"),
            Program(name: "주말 마포속으로(재)", dayOfWeek: .sunday, startAt: "18:00", endAt: "19:00"),
            Program(name: "BGM", dayOfWeek: .sunday, startAt: "19:00", endAt: "20:00"),
            Program(name: "알쓸맥잡(재)", dayOfWeek: .sunday, startAt: "20:00", endAt: "21:00"),
            Program(name: "L양장점(재)", dayOfWeek: .sunday, startAt: "21:00", endAt: "23:00"),
            Program(name: "뮤직홍[라디오 속 오로빌]", dayOfWeek: .sunday, startAt: "23:00", endAt: "24:00"),
        ]
    }
    
    private func dateFromTimeString(_ timeString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: today)
        if let year = components.year, let month = components.month, let day = components.day {
            let dateString = String(format: "%04d/%02d/%02d %@", year, month, day, timeString)
            return formatter.date(from: dateString)
        }
        return nil
    }
}

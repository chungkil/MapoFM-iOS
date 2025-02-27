//
//  CommunityView.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//

import SwiftUI


struct CommunityView: View {
    
    struct CommunityItems: Identifiable {
        var id: UUID = UUID()
        var name: String
        var imageName: String
        var URLString: String
    }
    
    let menuItems: [CommunityItems] = [
        .init(name: "사연 및 신청곡",
              imageName: "square.and.pencil",
              URLString: "https://www.mapofm.net/djbox"),
        .init(name: "프로그램",
              imageName: "waveform",
              URLString: "https://www.mapofm.net/program"),
        .init(name: "공지사항",
              imageName: "info.circle",
              URLString: "https://www.mapofm.net/notice"),
        .init(name: "마포FM 소개",
              imageName: "house",
              URLString: "https://www.mapofm.net/intro"),
        .init(name: "개인정보처리방침",
              imageName: "lock.fill",
              URLString: "https://www.mapofm.net/privacy")
    ]
    
    @State var isPresented: Bool = false
    @State var selectedURLString: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menuItems) { item in
                    Button {
                        selectedURLString = item.URLString
                        isPresented.toggle()
                    } label: {
                        Label(item.name, systemImage: item.imageName)
                    }
                }
                
                ShareLink("친구에게 공유", item: "https://www.mapofm.net")
            }
            .listStyle(.plain)
            .navigationTitle("참여하기")
            .sheet(isPresented: $isPresented) {
                NavigationStack {
                    SafariView(urlString: $selectedURLString)
                        .navigationBarTitleDisplayMode(.inline)
                        .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    CommunityView()
}

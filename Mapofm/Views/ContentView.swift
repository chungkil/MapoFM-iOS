//
//  ContentView.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var stream: Stream = Stream()

    @State var player: AVPlayer = AVPlayer()
    
    var body: some View {
        TabView {
            Tab("듣기", systemImage: "radio") {
                PlayerView(player: $player)
            }
            
            Tab("편성표", systemImage: "list.bullet.rectangle.portrait") {
                ScheduleView()
            }
            
            Tab("참여하기", systemImage: "person.2.wave.2.fill") {
                CommunityView()
            }
        }
        .onAppear {
            let audioSession = AVAudioSession.sharedInstance()
            try? audioSession.setCategory(.playback, mode: .default)
            try? audioSession.setActive(true)
            
            // 백그라운드 모드에서 VideoPlayer 재생
            UIApplication.shared.beginReceivingRemoteControlEvents()
            player.play()
            
            if let url = stream.streamURL {
                player = AVPlayer(url: url)
                player.play()
            }
        }
    }
}

#Preview {
    ContentView()
}

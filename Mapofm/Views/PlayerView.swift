//
//  PlayerView.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    var schedule: Schedule = Schedule()
    
    @Binding var player: AVPlayer
    
    var isPlaying: Bool {
        player.rate != 0
    }
    
    @State var currentProgram: Program? = nil
    @State var playButtonImage: String = ""
    
    @State private var currentTime = Date()
    @State private var logoScale: CGFloat = 1.0  // 로고 크기 조절을 위한 상태
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .hidden()
            
            VStack {
                Spacer()
                
                Image("mapofm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(
                        Rectangle()
                            .stroke(Color.white, lineWidth: 5)
                    )
                    .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                    .padding(35)
                    .scaleEffect(logoScale)  // 크기 조절 적용
                    .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: logoScale)  // 스프링 애니메이션 적용
                
                Text(currentProgram?.name ?? "")
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text(currentProgram?.startTimeString ?? "")
                    Text("~")
                    Text(currentProgram?.endTimeString ?? "")
                }
                    .padding(5)
                
                Spacer()
                
                HStack {
                    Button {
                        if isPlaying {
                            player.pause()
                            playButtonImage = "play.fill"
                        } else {
                            player.play()
                            playButtonImage = "pause.fill"
                        }
                        
                        animateLogo()  // 로고 애니메이션 실행
                    } label: {
                        Image(systemName: playButtonImage)
                            .font(.largeTitle)
                            .foregroundStyle(Color.buttonColor)
                            .padding(25)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            currentProgram = schedule.currentProgram
        }
        .onReceive(timer) { _ in
            self.currentTime = Date()
            
            currentProgram = schedule.currentProgram
        }
        .task(id: player.rate) {
            if isPlaying {
                playButtonImage = "pause.fill"
                print("update pause: \(playButtonImage)")
            } else {
                playButtonImage = "play.fill"
                print("update play: \(playButtonImage)")
            }
        }
    }
    
    private func animateLogo() {
        // 로고를 작게 만들었다가 다시 원래 크기로 돌아오는 애니메이션
        withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
            logoScale = 0.9
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0)) {
                logoScale = 1.0
            }
        }
    }
}

#Preview {
    PlayerView(player: .constant(AVPlayer()))
}

//
//  SoundsBootcamp.swift
//  ContinuedLearning
//
//  Created by Malith Madhushanka on 2024-01-25.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    
    enum SoundOption: String {
        case tada
        case badum
    }
    
    var player: AVAudioPlayer?
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}

struct SoundsBootcamp: View {
    
    
    
    var body: some View {
        VStack(spacing: 40) {
            Button("play sound 1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("play sound 2") {
                SoundManager.instance.playSound(sound: .badum)
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}

//
//  PlaySound.swift
//  Slot Machine
//
//  Created by Христиченко Александр on 2022-11-12.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Error: could nit find and play the sound file!")
        }
    }
}

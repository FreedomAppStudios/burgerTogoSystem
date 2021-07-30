//
//  PlaySound.swift
//  burger to go
//
//  Created by Other user on 7/29/21.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer!

func playSound() {
    let url = Bundle.main.url(forResource: "alertSound", withExtension: "mp3")
    
    guard url != nil else {
        return
    }
    
    do {
       player = try AVAudioPlayer(contentsOf: url!)
        player?.play()
    } catch {
        print("error")
    }
    
}

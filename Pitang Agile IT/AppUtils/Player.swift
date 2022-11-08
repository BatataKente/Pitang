//
//  Player.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import AVKit

class Player {
    
    private var player: AVPlayer? = nil
    
    func play(_ url: String?, videoContent: UIView) {
        
        guard let url = URL(string: url ?? ""), player == nil else {return}
        player = AVPlayer(url: url)
        
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = videoContent.frame
        videoContent.layer.addSublayer(layer)
        
        player?.play()
    }
}

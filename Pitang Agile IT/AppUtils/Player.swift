//
//  Player.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 17/08/1401 AP.
//

import AVKit

class Player {
    
    private var player: AVPlayer? = nil
    private var layer: AVPlayerLayer? = nil
    
    func play(_ url: String?, videoContent: UIView) {
        
        guard let url = URL(string: url ?? ""), player == nil else {return}
        player = AVPlayer(url: url)
        
        layer = AVPlayerLayer(player: player)
        
        guard let layer = layer else {return}
        layer.backgroundColor = UIColor.black.cgColor
        layer.frame = videoContent.frame
        videoContent.layer.addSublayer(layer)
        
        player?.play()
    }
}

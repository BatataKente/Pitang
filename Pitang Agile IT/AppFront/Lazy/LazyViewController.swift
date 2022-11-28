//
//  LazyViewController.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 07/09/1401 AP.
//

import UIKit

class LazyViewController: UIViewController {
    struct Calculator {
        static func calculateGamesPlayed() -> Int? {
            var games: [Int] = []
            for i in 1...4000 {games.append(i)}
            return games.last
        }
    }
    struct Player {
        var name, team, position: String
        var gamesPlayed = Calculator.calculateGamesPlayed()
        lazy var introduction = {
            return "Lero Lero.. Now enterning the game: \(name), \(position) for the \(team)."
        }()
    }
    var josicleison = Player(name: "Josicleison Elves", team: "Cavalos", position: "Atirador")
    override func loadView() {
        super.loadView()
        view.addGradientBackground(colors: [UIColor.systemPurple.cgColor,
                                            UIColor.systemMint.cgColor,
                                            UIColor.systemPink.cgColor])
        print(josicleison.introduction)
    }
}

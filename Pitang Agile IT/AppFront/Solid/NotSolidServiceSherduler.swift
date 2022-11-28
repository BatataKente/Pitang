//
//  NotSolidServiceSherduler.swift
//  Pitang Agile IT
//
//  Created by Josicleison Elves on 07/09/1401 AP.
//

import Foundation

class NotSolidServiceSherduler: NSObject {
    let id: String
    private var serviceTimer: Timer?
    private var timerTick: Int
    init(id: String) {
        self.id = id
        serviceTimer = nil
        timerTick = 0
    }
    func start() {
        serviceTimer = Timer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(timerDidFire),
                             userInfo: nil,
                             repeats: true)
    }
    func stop() {
        serviceTimer?.invalidate()
        serviceTimer = nil
        timerTick = 0
        
    }
    @objc func timerDidFire(_ timer: Timer) {
        timerTick += 1
        runServicesWithTick(timerTick)
    }
    private func runServicesWithTick(_ tick: Int) {
        if (tick % 1) == 0 {
            runTimelineUpdateService()
        }
        if (tick % 2) == 0 {
            runTimelineUpdateService()
        }
    }
    private func runTimelineUpdateService() {
        NotSolidTimeLineService.fetchTimeLineFor(user: id)
    }
}

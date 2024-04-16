//
//  TimerUtil.swift
//  RailRestPro Watch App
//
//  Created by Reyhan Ariq Syahalam on 08/04/24.
//

import Foundation
class TimerUtil{
    static func timeFormat(duration: Double) -> String {
        let minutes = String(format: "%02d", Int(duration) / 60)
        let second = String(format: "%02d", Int(duration) % 60)
        return "\(minutes):\(second)"
    }
}


//
//  WatchUtil.swift
//  RailRestPro Watch App
//
//  Created by Reyhan Ariq Syahalam on 08/04/24.
//

import Foundation
import WatchKit

class AlarmUtil: ObservableObject{
    static let shared = AlarmUtil()
    let device = WKInterfaceDevice.current()
    
    func triggerHaptic() {
        for i in 0..<20 {
            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 2)) {
                self.ringtoneHaptic()
            }
        }
    }
    
    func ringtoneHaptic(){
        let hapticSequence: [(haptic: WKHapticType, interval: TimeInterval)] = [
            (.start, 0.0),
            (.directionUp, 0.2),
            (.directionDown, 0.2),
            (.success, 0.5),
            (.failure, 0.7),
            (.retry, 0.5),
            (.stop, 1.0)
        ]
        
        for (index, hapticInfo) in hapticSequence.enumerated() {
            let delay = hapticSequence.prefix(index).map({ $0.interval }).reduce(0, +)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.device.play(hapticInfo.haptic)
            }
        }
    }
    
    func stopHaptic(){
       
    }
}


//
//  TimerViewModel.swift
//  RailRestPro Watch App
//
//  Created by Reyhan Ariq Syahalam on 08/04/24.
//

import Foundation
import HealthKitUI

class SessionViewModel: ObservableObject{
    @Published var isStarted = false
    @Published var isRinging = false
    @Published var showEndAlert = false
    
    @Published var timeDefault = 5.0
    @Published var timeRemaining = 0.0
    @Published var timer: Timer?
    @Published var sessionMode = 0 // 0:Countdown Timer (Default); 1: Countdown Timer (History); 2: HeartRateMode
    
    @Published var healthKitManager: HealthKitManager?
    
    func startTimer(){
        isStarted = true
        timeRemaining = timeDefault
        
        if self.sessionMode == 0{
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    
                }
            }
        }
    }
    
    func endOfTime(){
        self.stopTimer()
        
    }
    
    func stopTimer(){
        timer?.invalidate()
        self.isStarted = false
        self.resetTimer()
    }
    
    func resetTimer(){
        timeRemaining = timeDefault
    }
    
    func alarmRinging(){
        self.isRinging = true
//        AlarmUtil.shared.startHaptic()
//        for i in 0..<5 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + (Double(i) * 2)) {
//                AlarmUtil.shared.ringtoneHaptic()
//                print("OK")
//            }
//        }
        AlarmUtil.shared.ringtoneHaptic()
    }
    
    func stopAlarm(){
        isRinging = false
        isStarted = false
        print("Alarm Stopped")
    }
    
    
    func latestHeartRate() {
        
    }
    
    func healthKitAuth(){
        self.healthKitManager = HealthKitManager()
        if healthKitManager?.authorization() ?? false {
            self.sessionMode = 0
        }else {
            self.sessionMode = 2
        }
    }
    
}

//
//  HealthKitUtil.swift
//  RailRestPro Watch App
//
//  Created by Reyhan Ariq Syahalam on 08/04/24.
//

import Foundation
class HealthKitUtil {
    static func fetchHeartRate() -> HeartRate  {
        return HeartRate(value: 60.9, timestamp: Date(), source: "HealthKit")
    }
}

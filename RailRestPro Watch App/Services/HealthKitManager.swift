//
//  Authorization.swift
//  RailRestPro Watch App
//
//  Created by Reyhan Ariq Syahalam on 08/04/24.
//

//import Foundation
//import HealthKit
//
//class HealthKitManager {
//    let healthStore = HKHealthStore()
//    
//    func requestAuthorization(completion: @escaping (Bool, Error?) -> Void) {
//        guard HKHealthStore.isHealthDataAvailable() else {
//            completion(false, nil)
//            print("1")
//            return
//        }
//        
//        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
//            completion(false, nil)
//            print("2")
//            return
//        }
//        
//        healthStore.requestAuthorization(toShare: [], read: [heartRateType]) { (success, error) in
//            completion(success, error)
//            print("3")
//        }
//    }
//    
//    func fetchLatestHeartRate(completion: @escaping (Double?, Error?) -> Void) {
//        guard let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate) else {
//            completion(nil, nil)
//            return
//        }
//        
//        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
//        let query = HKSampleQuery(sampleType: heartRateType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, results, error) in
//            guard error == nil, let latestSample = results?.first as? HKQuantitySample else {
//                completion(nil, error)
//                return
//            }
//            
//            let heartRate = latestSample.quantity.doubleValue(for: HKUnit(from: "count/min"))
//            completion(heartRate, nil)
//        }
//        
//        healthStore.execute(query)
//    }
//    
//}

import Foundation
import HealthKit // Import HealthKit so that we can call for HealthKit object
import HealthKitUI

class HealthKitManager {
    var healthStore = HKHealthStore() // Create 'Health Store' object for our app to ask for permission to share, or read HealthKit data.

    func authorization() -> Bool {
        healthStore.requestAuthorization(toShare: [] , read: [HKQuantityType(.heartRate)]) { (success, error) in
            if !success {
                print("rejected")
            }
        }
        return true
    }
    
}

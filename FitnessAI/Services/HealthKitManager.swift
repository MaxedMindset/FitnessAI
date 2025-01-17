import Foundation
import HealthKit

class HealthKitManager {
    let healthStore = HKHealthStore()

    func requestAuthorization() {
        let allTypes = Set([
            HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
            HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!
        ])

        healthStore.requestAuthorization(toShare: nil, read: allTypes) { success, error in
            if !success {
                print("HealthKit authorization failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }

    func fetchCaloriesBurned(completion: @escaping (Double) -> Void) {
        guard let calorieType = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned) else {
            completion(0.0)
            return
        }

        let query = HKStatisticsQuery(quantityType: calorieType, quantitySamplePredicate: nil, options: .cumulativeSum) { _, result, _ in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            completion(sum.doubleValue(for: .kilocalorie()))
        }

        healthStore.execute(query)
    }
}

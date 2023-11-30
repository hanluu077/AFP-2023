// Medication.swift

import Foundation

struct Medication: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var dosage: Int
    var startDate: Date
    var endDate: Date
}

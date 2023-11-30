// MedicationRowView.swift

import SwiftUI

struct MedicationRowView: View {
    var medication: Medication
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundStyle(.green)
                .opacity(0.4)
            
            VStack(alignment: .leading) {
                Text("Name: \(medication.name)")
                    .font(.title2)
                Text("Type: \(medication.type)")
                Text("Dosage: \(medication.dosage)")
                Text("Start Date: \(formattedDate(medication.startDate))")
                Text("End Date: \(formattedDate(medication.endDate))")
            }
            .padding()
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
}



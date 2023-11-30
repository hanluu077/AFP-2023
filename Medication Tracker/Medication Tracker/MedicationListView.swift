// MedicationListView.swift

import SwiftUI

struct MedicationListView: View {
    @State private var medications: [Medication] = []
    
    var body: some View {
        NavigationView {
            VStack {
                List(medications) { medication in
                    MedicationRowView(medication: medication)
                }
                
                NavigationLink(destination: MedicationFormView(medications: $medications)) {
                    Text("Add Medication")
                }
                .padding()
            }
            .navigationBarTitle("Medication List")
            .onAppear {
                // Load medications from UserDefaults
                if let savedMedications = UserDefaults.standard.data(forKey: "medications") {
                    let decoder = JSONDecoder()
                    if let decodedMedications = try? decoder.decode([Medication].self, from: savedMedications) {
                        self.medications = decodedMedications
                    }
                }
            }
        }
    }
}

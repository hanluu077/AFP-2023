// MedicationFormView.swift

import SwiftUI

struct MedicationFormView: View {
    @Binding var medications: [Medication]
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var description = ""
    @State private var type = ""
    @State private var dosage = 0
    @State private var startDate = Date()
    @State private var endDate = Date()
    // Property for the type dropdown
    @State private var selectedTypeIndex = 0
    private let medicationTypes = ["Select one", "💊 Prescription", "🩺 Appointments", "Other"]
    
    var body: some View {
        NavigationView {
            Form {
                
                TextField("Title", text: $name).font(.title)
                TextField("Description", text: $description)
                Section(header: Text("")) {
                    // Dropdown for Type
                    Picker("Category", selection: $selectedTypeIndex) {
                        ForEach(medicationTypes.indices, id: \.self) { index in
                            Text(medicationTypes[index])
                        }
                        
                    }
                    
                }
                
                Section(header: Text("Treatment Dates")) {
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                }
                
             
                    Button("Save Medication") {
                        saveMedication()
                        // Dismiss the form
                        presentationMode.wrappedValue.dismiss()

                }
            }
            .navigationBarTitle("Medication Form")
        }
    }
    
    func saveMedication() {
        let newMedication = Medication(
            name: name,
            type: medicationTypes[selectedTypeIndex], // Use selected type from the dropdown
            dosage: dosage,
            startDate: startDate,
            endDate: endDate
        )
        medications.append(newMedication)
        // Update UserDefaults
        saveToUserDefaults()
    }
    
    private func saveToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(medications) {
            UserDefaults.standard.set(encoded, forKey: "medications")
        }
    }
}



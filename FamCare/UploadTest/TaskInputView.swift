// TASK FORM VIEW

import SwiftUI

struct TaskInputView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var tasks: Array<Task>
    @State private var createdTask = Task(
        title: "",
        description: "",
        type: "",
        startDate: Date(),
        endDate: Date(),
        location: "",
        assigned: ""
    )
    
    @State private var pickedImage: UIImage? = nil
    
    private let types = ["💊  Prescription", "👨‍⚕️  GP Referral", "🩻  X-Ray", "Other"]
    private let assigned = ["Not Assigned", "Mum", "Dad", "Jack", "Jill"]
    @State private var selectedTypeIndex = 0 // Property for the type picker.
    @State private var selectedAssignToIndex = 0
    
    @State private var showCamera = false //camera variables
    @State private var showActionSheet = false
    
    @State private var image: Image? //photo gallery variables
    @State private var isShowingImagePicker = false

    let navigationBarAppearance = UINavigationBar.appearance()
    
    var body: some View {
        NavigationStack {
            
            Form {
                TextField("Title", text:$createdTask.title)
                TextField("Description", text: $createdTask.description, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                Section(header: Text("Document details").foregroundColor(.white).fontWeight(.bold)) {
                    Picker("Type", selection: $selectedTypeIndex) {
                        ForEach(types.indices, id: \.self) {
                            Text(types[$0])
                        }
                        .foregroundStyle(Color.backgroundPurple)
                    }
                    DatePicker(
                        "Start Date",
                        selection: $createdTask.startDate, displayedComponents: [.date, .hourAndMinute]
                    )
                    DatePicker(
                        "End Date",
                        selection: $createdTask.endDate, displayedComponents: [.date, .hourAndMinute]
                    )
                    //                    HERE
                }
                TextField("Location", text:$createdTask.location)
                
                Picker("Assign to", selection: $selectedAssignToIndex) {
                    ForEach(assigned.indices, id: \.self) {
                        Text(assigned[$0])
                    }
                }
                
                
                
                //                Button(action: {
                //                    showActionSheet = true
                //                }) {
                //                    Image(systemName: "plus.circle")
                //                        .resizable()
                //                        .frame(width: 30, height: 30)
                //                        .foregroundColor(.white)
                //                }.background(Color.backgroundPink)
                //                    .clipShape(Circle())
                ImageEditView(selectedImage: $pickedImage)
                // POP-UP ACTION SHEET
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(
                            title: Text("Choose an option"),
                            buttons: [
                                .default(Text("Take Pic")) {
                                    self.showCamera = true
                                },
                                .default(Text("Upload Documents")) {
                                    self.isShowingImagePicker = true
                                    
                                    
                                },
                                .cancel()
                            ]
                        )
                    }
                    .sheet(isPresented: $showCamera) {
                        CreateImageView()
                    }.padding(.vertical, 60)
                
                
                Button("Save Task") {
                    updateAndSaveTasks()
                    dismiss()
                } .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.white)
                    .frame(width: 100, height: 40)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.backgroundPink))
                    .padding(.leading, 100)
                
            }
            
            .background(Color.backgroundPurple)
            .scrollContentBackground(.hidden)
            .onChange(of: selectedTypeIndex) {
                createdTask.type = types[selectedTypeIndex]
            }
            .onChange(of: selectedAssignToIndex) {
                createdTask.assigned = assigned[selectedAssignToIndex]
            }
            .onChange(of: pickedImage) {
                createdTask.imageData = pickedImage?.base64
//                if let taskImage = task.imageData?.toImage {
//                    Image(uiImage: taskImage)
//                }
            }
            .navigationBarTitle("Task Form")
            .onAppear {

                navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
                navigationBarAppearance.titleTextAttributes =
                [.foregroundColor: UIColor.white]
            }
        } //end of navigationStack
    }
    
    private func updateAndSaveTasks() {
        tasks.append(createdTask)
        guard let encoded = try? JSONEncoder().encode(tasks) else {
            tasks.removeLast()
            print("Task could not be saved.")
            return
        }
        UserDefaults.standard.set(encoded, forKey: "tasks") // Update `UserDefaults`.
    }
}

struct TaskInputView_Previews: PreviewProvider {
    static var previews: some View {
        let tasks: [Task] = []  // Provide sample tasks here
        return TaskInputView(tasks: .constant(tasks))
    }
}


// HOME PAGE > NANA'S CLUB PAGE

import SwiftUI

struct ContentViewDocsView: View {
    @Binding var tasks: Array<Task> 
    
    @State var selected = 1
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var selectedOption: String?
    
    // GALLERY VARIABLES
    @State private var image: Image?
    @State private var isShowingImagePicker = false
    
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            GroupBox {
                // CREATING GRANDMA'S CONTENT VIEW (TO-DO)
                VStack(alignment: .center, spacing: 8) {
                    Image("cool_gran")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150, height: 100)
                        .clipShape(Circle())
                    
                    Text("Nana's Club")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .offset(x: 0, y:10)
                        .foregroundColor(.white)
                    
                    HStack(spacing: -15) {
                        Image("MumPic")
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height:50)
                            .clipShape(Circle())
                        Image("DadPic")
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height:50)
                            .clipShape(Circle())
                        Image("BrotherPic")
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height:50)
                            .clipShape(Circle())
                        Image("SisterPic")
                            .resizable()
                            .scaledToFit()
                            .frame(width:50, height:50)
                            .clipShape(Circle())
                    }
                    .padding(.vertical, 10)
                    NavigationLink(destination: myFam()){
                        Text("4 Members")
                            .foregroundColor(.white)
                            .underline()
                    }
                }
                .frame(width: 350, height: 270, alignment: .top)
            } // End of `GroupBox`
            .groupBoxStyle(TransparentGroupBox())
            VStack {
                // PICKER FOR TASKS AND DOCUMENTS
                Picker(selection: $selected, label: Text("Picker"), content: {
                    Text("Everyone's Tasks").tag(1)
                    Text("Documents").tag(2)
                })
                .pickerStyle(SegmentedPickerStyle())
                
                if selected == 1 {
                    ContentView(tasks: $tasks)
                }
                
                else {
                    List(tasks) { task in
                        if let taskImage = task.imageData?.toImage {
                            NavigationLink {
                                TaskDetailView(task: task)
                            } label: {
                                Image(uiImage: taskImage)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }
                }
                
            } //end of VStack
            .cornerRadius(30)
            ScrollView {}
                .frame(height: 20)
                .scrollTransition { effect, phase in
                    effect
                        .scaleEffect(phase.isIdentity ? 1: 0.8)
                    //but scroll transition doesn't seem to work
                }
            
            if selected == 2 {
                
            }
            // TAKE A PICUTRE OPTION --> WILL IMPLEMENT IN THE FUTURE
//                Button(action: {
//                    showActionSheet = true
//                }) {
//                    Image(systemName: "plus.circle")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                }
                // POP-UP ACTION SHEET
                //                .actionSheet(isPresented: $showActionSheet) {
                //                    ActionSheet(
                //                        title: Text("Choose an option"),
                //                        buttons: [
                //                            .default(Text("Take Pic")) {
                //                                self.showCamera = true
                //                            },
                //                            .default(Text("Upload Documents")) {
                //                                self.isShowingImagePicker = true
                //
                //                            },
                //                            .cancel()
                //                        ]
                //                    )
                //                }
                //                .sheet(isPresented: $isShowingImagePicker) {
                //                    ImagePicker(image: $image) // Updates the view (cuz now toggle is true).
                //                }
                //                .sheet(isPresented: $showCamera) {
                //                    CreateImageView()
                //                }
            }
        }
        //        .searchable(text: $searchText)
    }


struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .frame(maxWidth: .infinity)
        //            .padding()
            .background(Color.backgroundPurple)
    }
}

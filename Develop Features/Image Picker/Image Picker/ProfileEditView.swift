import SwiftUI
import UIKit

struct ProfileEditView: View {
    @State private var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var profileImage: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
               
                } else {
                    Text("No Image Selected")
                }
                
                Button("Select Image") {
                    isImagePickerPresented.toggle()
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                    
                    
                    
                }
                .padding()
                
                NavigationLink(destination: ProfileView(selectedProfile: $selectedImage)) {
                    Text("Go to Profile")
                }
            }
            .navigationTitle("Image Selection")
        }
    }
}


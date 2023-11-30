// IMAGE EDIT VIEW

import SwiftUI
import UIKit

struct ImageEditView: View {
    @Binding var selectedImage: UIImage?
    @State private var isImagePickerPresented = false
    @State private var profileImage: UIImage?
    
    var body: some View {
        NavigationStack {
            VStack {
                // need to update if photo already exist display profile photo if not and edit button - we should create a view to pass the formatting of the profile image too.
                
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFit()
               
                } else {
                    Text("Upload Documents")
                        .padding(.leading, 80)
                }
                
                Button("Select Image") {
                    isImagePickerPresented.toggle()
                        
                }
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 10)
                .padding(.leading, 80)
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImage: $selectedImage)
                    
                }
                .padding()
                
            }
//            .navigationTitle("Image Selection")
        }
    }
}


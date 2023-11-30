// IN-BUILT CAMERA BACK-END 
// WILL IMPLEMENT IN THE FUTURE 

import SwiftUI
import UIKit

struct CreateImageView: View {
    @State private var showCamera = false
    @State private var showPreview = false
    @State private var capturedImage: UIImage?
    
    var body: some View {
        
        CameraView(capturedImage: self.$capturedImage, showPreview: self.$showPreview)
        
        
        if capturedImage != nil {
            Button(action: {
                self.showPreview = true
            }) {
                Text("View Preview")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            .sheet(isPresented: $showPreview) {
                CameraView(capturedImage: self.$capturedImage, showPreview: self.$showPreview)
            }
        }
    }
    
    
    
    struct CameraView: UIViewControllerRepresentable {
        @Binding var capturedImage: UIImage?
        @Binding var showPreview: Bool
        
        func makeCoordinator() -> Coordinator {
            Coordinator(parent: self)
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<CameraView>) -> UIImagePickerController {
            let controller = UIImagePickerController()
            controller.sourceType = .camera
            controller.delegate = context.coordinator
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<CameraView>) {
            // Update the view controller
        }
        
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            let parent: CameraView
            
            init(parent: CameraView) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let image = info[.originalImage] as? UIImage {
                    parent.capturedImage = image
                    parent.showPreview = true
                }
                
                picker.dismiss(animated: true, completion: nil)
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    struct PreviewView: View {
        let image: UIImage
        
        var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
    }
    
    struct CreateImageView2_Previews: PreviewProvider {
        static var previews: some View {
            CreateImageView()
        }
    }
}

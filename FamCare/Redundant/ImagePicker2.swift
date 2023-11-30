//
//import SwiftUI
//import UIKit
//
//struct ImagePicker: UIViewControllerRepresentable {
//    @Environment(\.presentationMode) private var presentationMode
//    @Binding var image: Image?
//    
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//        @Binding var presentationMode: PresentationMode
//        @Binding var image: Image?
//        
//        init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
//            _presentationMode = presentationMode
//            _image = image
//        }
//        
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            if let uiImage = info[.originalImage] as? UIImage {
//                image = Image(uiImage: uiImage)
//            }
//            
//            presentationMode.dismiss()
//        }
//        
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            presentationMode.dismiss()
//        }
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(presentationMode: presentationMode, image: $image)
//    }
//    
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = context.coordinator
//        return imagePicker
//    }
//    
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
//}
//

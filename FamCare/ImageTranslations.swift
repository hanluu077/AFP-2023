import SwiftUI

// TO GET IMAGE FROM IMAGE GALLERY TO DISPLAY ON THE VIEW, WE NEED TO CONVERT IMAGE TO A STRING INTO THE MEMORY
// THEN CONVERT THE STRING BACK TO THE IMAGE TO THE VIEW


extension UIImage {
    // CONVERTING IMAGE INTO A STRING
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    // CONVERTING STRING IMAGE INTO AN ACUTAL IMAGE
    var toImage: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}

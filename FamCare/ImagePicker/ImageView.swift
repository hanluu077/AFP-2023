// IMAGE VIEW

import SwiftUI

struct ImageView: View {
    @Binding var selectedProfile: UIImage?
    
    var body: some View {
        VStack {
            if let selectedProfile = selectedProfile {
                Image(uiImage: selectedProfile)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .shadow(color: .black, radius: 12)
            } else {
                Text("Upload Document")
            }
        }
        .navigationTitle("Profile")
    }
}


#Preview {
    ImageView(selectedProfile: .constant(UIImage(systemName: "person")!))
}

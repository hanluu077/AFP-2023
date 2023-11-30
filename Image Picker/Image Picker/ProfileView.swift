import SwiftUI

struct ProfileView: View {
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
                Text("No Profile Image Selected")
            }
                    }
        .navigationTitle("Profile")
    }
}


#Preview {
    ProfileView(selectedProfile: .constant(UIImage(systemName: "person")!))
}

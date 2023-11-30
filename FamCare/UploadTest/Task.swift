// CREATING TASK COSNTRUCTORS

import SwiftUI

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var type: String
    var startDate: Date
    var endDate: Date
    var location: String
    var assigned: String
    
    var imageData: String? = nil
    // TODO: Link to docs?
}

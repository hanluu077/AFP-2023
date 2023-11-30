

import SwiftUI

struct TaskDetailView: View {
    var task: Task
    var image: Image?
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                // PURPLE THEME HEADER
                Color.backgroundPurple
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Detailed Task")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .edgesIgnoringSafeArea(.all)
                        
                        // STATIC TASK INFO
                        VStack(alignment: .leading) {
                            Text("\(task.title)").font(.title).bold()
                                .fixedSize(horizontal: false, vertical: true)  // BREAK LINE AFTER REACHING HORIZONTAL LINE LIMIT
                            Spacer()
                            
                            Text("Description:").bold()
                            Text("\(task.description)")
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true) // BREAK LINE AFTER REACHING HORIZONTAL LINE LIMIT
                            Spacer()
                            
                            Text("Assigned to:").bold()
                            Text("\(task.assigned)")
                            Spacer()
                            
                            Text("Location:").bold()
                            Text("\(task.location)")
                            Spacer()
                            
                            Text("Start Date:").bold()
                            Text("\(dateString(task.startDate)) \(formattedTime(task.startDate))")
                            Spacer()
                            
                            Text("End Date:").bold()
                            Text("\(dateString(task.endDate)) \(formattedTime(task.endDate))")
                            Spacer()
                            
                            // CONVERTING STRING IMAGE INTO AN ACTUAL IMAGE
                            if let taskImage = task.imageData?.toImage {
                                Image(uiImage: taskImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 350)
                            }
                            
                        }
                        .padding(.leading, 18)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    
                }
                
            }
        }
    }
    
    // GET MONTH FROM DATE()
    private func monthString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: date)
    }
    // GET DAY OF WEEK FROM DATE()
    private func DayOfWeekString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
    }
    
    // GET DATE FROM DATE()
    private func DayNumberString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
    
    // GET TIME FROME DATE()
    private func timeString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
    
    private func dateString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
    }
    //TIME FROM DATE
    private func formattedTime(_ date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "h:mm a"
           return dateFormatter.string(from: date)
       }
    
}


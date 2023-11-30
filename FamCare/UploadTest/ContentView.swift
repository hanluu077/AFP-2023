// NANA'S CLUB > EVERYONE'S TASKS PAGE

import SwiftUI

struct ContentView: View {
    @Binding var tasks: Array<Task>
    @State var searchText = ""
    
    //    SEARCHING FOR WORDS CONTAINING WORDS / CHARACTERS
    var filter: [Task] {
        searchText.isEmpty ? tasks : tasks.filter { task in
            task.title.localizedCaseInsensitiveContains(searchText) ||
            task.description.localizedCaseInsensitiveContains(searchText) ||
            task.location.localizedCaseInsensitiveContains(searchText) ||
            task.type.localizedCaseInsensitiveContains(searchText) ||
            task.assigned.localizedCaseInsensitiveContains(searchText) ||
            dateString(task.startDate).localizedCaseInsensitiveContains(searchText) ||
            dateString(task.endDate).localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                // Refer to filtered array.
                List(filter) { task in
                    NavigationLink {
                        TaskDetailView(task: task)
                    } label: {
                        VStack(alignment: .leading) {
                            //                            Text(task.title)
                            //                                .font(.title2)
                            //                                .fontWeight(.bold)
                            
                            // TASKS IN LISTVIEW
                            /*
                             Text(task.description)
                             Text("Location: \(task.location)")
                             Text("Type: \(task.type)")
                             Text("Assign to: \(task.assigned.joined(separator: ", "))")
                             Text("\(dateString(task.startDate)) to \(dateString(task.endDate))")
                             */
                            
                            // TASKS IN CALENDAR ICON VIEW
                            HStack{
                                ZStack{
                                    Rectangle().frame(width: 80, height: 80).foregroundColor(.lightPurple)
                                        .cornerRadius(10)
                                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, topTrailing: 10)).frame(width: 80, height:
                                                                                                                        30).foregroundColor(.darkPurple).offset(x:0, y:-33)
                                    
                                    Text("\(monthString(task.startDate))")
                                        .foregroundColor(Color.white)
                                        .offset(x:0, y:-30)
                                        .font(.system(size: 20))
                                    
                                    
                                    Text("\(DayNumberString(task.startDate))")
                                        .foregroundColor(Color.white)
                                        .offset(x:0, y:10)
                                        .font(.system(size: 40))
                                }
                                Rectangle().frame(width: 10, height: 80).foregroundColor(.backgroundPink)
                                    .cornerRadius(20)
                                    .padding(.leading, 15)
                                    .padding(.trailing, 15)
                                
                                VStack(alignment: .leading) {
                                    Text("\(task.title)")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                    Text("Time: \(timeString(task.startDate))")
                                    Text("Location: \(task.location)")
                                    Text("Assigned to: \(task.assigned)")
                                    
                                    
                                    
                                    
                                }
                            } // END OF CALENDAR ICON VIEW
                        }
                        .padding()
                    }
                }
                .listStyle(.plain)
                NavigationLink {
                    TaskInputView(tasks: $tasks)
                } label: {
                    HStack {
                        Text("Add Task")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.backgroundPink))
                    .padding(30)
                }
                
            }
        }
    }
    
    // GET DATE()
    private func dateString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter.string(from: date)
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
//TIME FROM DATE
private func formattedTime(_ date: Date) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "h:mm a"
       return dateFormatter.string(from: date)
   }

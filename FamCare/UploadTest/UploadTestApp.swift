// SYSTEM BOOT-UP PAGE

import SwiftUI

@main
struct UploadTestApp: App {
    // MARK: This should be encapsulated by an `ObservableObject` in reality. Don't worry about it for now.
    @State private var tasks: Array<Task> = []
    
    // LOADS UP THE TASKS BACK ONCE THE APP IS LAUNCHED
    init() {
        guard let saved = UserDefaults.standard.data(forKey: "tasks") else {
            print("Tasks could not be found.")
            return
        }
        guard let decoded = try? JSONDecoder().decode([Task].self, from: saved) else {
            print("Tasks could not be decoded.")
            return
        }
        self.tasks = decoded
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                AllMembersView(tasks: $tasks)  
                    .tabItem {
                        Image(systemName: "house")
                            .tint(.white)
                        Text("Home")
                    }
                
                ContentView(tasks: $tasks)
                    .tabItem {
                        Image(systemName: "list.dash")
                            .tint(.white)
                        Text("Task")
                    }
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = .white
            }
            .tint(.backgroundPink)
            
        }
    }
}

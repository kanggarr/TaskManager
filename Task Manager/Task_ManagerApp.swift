//
//  Task_ManagerApp.swift
//  Task Manager
//
//  Created by Gurjot Singh on 31/03/23.
//

import SwiftUI

@main
struct Task_ManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  ProjVerao2024App.swift
//  ProjVerao2024
//
//  Created by user226757 on 9/15/22.
//

import SwiftUI

@main
struct ProjVerao2024App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

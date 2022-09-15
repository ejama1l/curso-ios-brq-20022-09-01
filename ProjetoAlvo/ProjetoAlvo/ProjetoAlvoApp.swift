//
//  ProjetoAlvoApp.swift
//  ProjetoAlvo
//
//  Created by user226757 on 9/8/22.
//

import SwiftUI

@main
struct ProjetoAlvoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(slideValue: 50.0)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

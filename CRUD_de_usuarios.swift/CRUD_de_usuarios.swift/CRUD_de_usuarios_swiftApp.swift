//
//  CRUD_de_usuarios_swiftApp.swift
//  CRUD_de_usuarios.swift
//
//  Created by user226757 on 9/20/22.
//

import SwiftUI

@main
struct CRUD_de_usuarios_swiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

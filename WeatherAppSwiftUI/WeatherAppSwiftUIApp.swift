//
//  WeatherAppSwiftUIApp.swift
//  WeatherAppSwiftUI
//
//  Created by Apple on 07/09/24.
//

import SwiftUI

@main
struct WeatherAppSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            WeatherView()
           // ContentView()
              //  .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

//
//  CardGameApp.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import SwiftUI
import CoreData
import Foundation

@main
struct CardGameApp: App {
    @StateObject private var dataController = DataControllerModel()
    @StateObject private var topCardsSetModel: TopCardsSetModel

    init() {
        let context = DataControllerModel().container.viewContext // Временный DataController
        let dataControllerTemp = DataControllerModel()
        _topCardsSetModel = StateObject(wrappedValue: TopCardsSetModel(context: context, dataController: dataControllerTemp))
    }

    var body: some Scene {
        WindowGroup {
            MainContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) // Передаем Core Data Context
                .environmentObject(dataController)
                .environmentObject(topCardsSetModel) // Передаем TopCardsSetModel
        }
    }
}

//
//  TopCardsSetModel.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import Foundation
import CoreData

class TopCardsSetModel: ObservableObject {
    @Published var topCardsStorage: [TopCardsSetEntity] = []
    private var context: NSManagedObjectContext
    private let dataController: DataControllerModel
    
    init(context: NSManagedObjectContext, dataController: DataControllerModel) {
        self.context = context
        self.dataController = dataController
        fetchTopCards()
    }
    //    func addCardsToTopDeck(deck: TopCardsSetEntity, text: String, translation: String) {
    //        let newCards = CardEntity(context: context)
    //        newCards.text = text
    //        newCards.translate = translation
    //        newCards.deckTop = deck
    //        dataController.saveContext()
    //        fetchTopCards()
    //    }
    
    func fetchTopCards() {
        let requset: NSFetchRequest<TopCardsSetEntity> = TopCardsSetEntity.fetchRequest()
        do {
            topCardsStorage = try context.fetch(requset)
        } catch {
            print("Could not fetch data")
        }
    }
    
    //    func deleteTopCards(deck: TopCardsSetEntity) {
    //        context.delete(deck)
    //        dataController.saveContext()
    //        fetchTopCards()
    //    }
    
    
    enum cardsImage: String, CaseIterable {
        case tokyo
        case madrid
        case london
    }
    
    func getImage(for card: cardsImage) -> String {
        switch card {
        case .tokyo: "tokyo"
        case .madrid: "mardrid"
        case .london: "london"
        }
    }
}

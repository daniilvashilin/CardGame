//
//  DataControllerModel.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import Foundation
import CoreData

class DataControllerModel: ObservableObject {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "DataGlobal")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistent store: \(error)")
            } else {
                
            }
        }
        preloadDataFromJSON()
    }
//    func clearTopCards() {
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = TopCardsSetEntity.fetchRequest()
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        do {
//            try container.viewContext.execute(deleteRequest)
//            try container.viewContext.save()
//        } catch {
//            print("Failed to clear top cards: \(error)")
//        }
//    }
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Failed to save the data")
            }
        }
    }
    func preloadDataFromJSON() {
        guard let url = Bundle.main.url(forResource: "TopCardsSorce", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        
        let context = container.viewContext
        
        do {
            let data = try Data(contentsOf: url)
            let decodedDecks = try JSONDecoder().decode([TopCard].self, from: data)
            
            print("Loaded decks:")
            for deck in decodedDecks {
                print("Deck ID: \(deck.id), Name: \(deck.name)")
                let fetchRequest: NSFetchRequest<TopCardsSetEntity> = TopCardsSetEntity.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "id == %@", deck.id)
                
                let count = try context.count(for: fetchRequest)
                if count == 0 {
                    let newDeck = TopCardsSetEntity(context: context)
                    newDeck.id = deck.id
                    newDeck.name = deck.name
                    newDeck.imageName = deck.imageName
                    
                    for card in deck.cards {
                        print("Creating CardEntity for card: \(card.text)")
                        // Создание новой карты
                        let newCard = CardEntity(context: context)
                        newCard.text = card.text
                        newCard.translate = card.translate
                        newCard.deckTop = newDeck // Устанавливаем связь с newDeck
                    }
                }
            }
            try context.save()
        } catch {
            print("Error loading JSON: \(error)")
        }
    }
    
    struct TopCard: Decodable {
        let id: String
        let name: String
        let imageName: String
        let cards: [Card]
    }
    
    struct Card: Decodable {
        let text: String
        let translate: String
    }
}




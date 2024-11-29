//
//  UserCardsSetModel.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import Foundation
import CoreData

class UserCardsSetModel: ObservableObject {
    
    @Published var userCardsStorage: [UserCustomCardsEntity] = []
    private let context: NSManagedObjectContext
    private let dataController: DataControllerModel
    
    init(context: NSManagedObjectContext, dataController: DataControllerModel) {
        self.context = context
        self.dataController = dataController
        fetchCustomCards()
    }
 
    func addCardsToCustomDeck(deck: UserCustomCardsEntity, text: String, translation: String) {
        let newCards = CardEntity(context: context)
        newCards.text = text
        newCards.translate = translation
        newCards.deckUser = deck
        dataController.saveContext()
        fetchCustomCards()
    }
    
    func fetchCustomCards() {
        let requset: NSFetchRequest<UserCustomCardsEntity> = UserCustomCardsEntity.fetchRequest()
        do {
            userCardsStorage = try context.fetch(requset)
        } catch {
            print("Could not fetch user cards: \(error.localizedDescription)")
        }
    }
    
    func deleteCustomCards(deck: UserCustomCardsEntity) {
        context.delete(deck)
        dataController.saveContext()
        fetchCustomCards()
    }
}

//
//  FavoriteCardsSetModel.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import Foundation
import CoreData

class FavoriteCardsSetModel: ObservableObject {
    @Published var favoriteCardsStroage: [FavoriteCardsSetEntity] = []
    private let context: NSManagedObjectContext
    private let dataController: DataControllerModel
    
    init(context: NSManagedObjectContext, dataController: DataControllerModel) {
        self.context = context
        self.dataController = dataController
        fetchFavoriteCards()
    }
    
    func fetchFavoriteCards() {
        let request: NSFetchRequest<FavoriteCardsSetEntity> = FavoriteCardsSetEntity.fetchRequest()
        do {
            favoriteCardsStroage = try context.fetch(request)
        } catch {
            print("Could not fetch data")
        }
    }
    
    func addCardsToFavoriteDeck(deck: FavoriteCardsSetEntity, text: String, translation: String) {
        let newCards = CardEntity(context: context)
        newCards.text = text
        newCards.translate = translation
        newCards.deckFavorite = deck
        dataController.saveContext()
        fetchFavoriteCards()
    }
    
    func deleteFavoriteCards(deck: FavoriteCardsSetEntity) {
        context.delete(deck)
        dataController.saveContext()
        fetchFavoriteCards()
    }
    
    
    
}

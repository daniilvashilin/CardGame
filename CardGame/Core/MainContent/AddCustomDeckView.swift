//
//  AddCustomDeckView.swift
//  CardGame
//
//  Created by Daniil on 30/11/2024.
//

import SwiftUI

struct AddCustomDeckView: View {
    @EnvironmentObject var userCardsModel: UserCardsSetModel
    @State var word = ""
    @State var translation = ""
    var body: some View {
        VStack {
            TextField("Word", text: $word)
                .padding()
                .textFieldStyle(.roundedBorder)
            TextField("Translate", text: $translation)
                .padding()
                .textFieldStyle(.roundedBorder)
            
            Button {
                if let selectedDeck = userCardsModel.userCardsStorage.first {
                    userCardsModel.addCardsToCustomDeck(
                        deck: selectedDeck,
                        text: word,
                        translation: translation
                    )
                }
            } label: {
                Text("Add")
            }
            
            ForEach(userCardsModel.userCardsStorage) {entity in
                Text(entity.name ?? "Defualt")
            }
            
        }
    }
}

#Preview {
    AddCustomDeckView()
}

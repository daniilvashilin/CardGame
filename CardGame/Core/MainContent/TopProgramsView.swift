//
//  TopProgramsView.swift
//  CardGame
//
//  Created by Daniil on 29/11/2024.
//


import SwiftUI

struct TopProgramsView: View {
    @EnvironmentObject var topCardsSetModel: TopCardsSetModel

    var body: some View {
        VStack {
            Text("Select a plan")
                .padding()
            ScrollView {
                ForEach(topCardsSetModel.topCardsStorage, id: \.id) { entity in
                    NavigationLink(destination: Text("Details for \(entity.name ?? "")")) {
                        ZStack {
                            if let imageName = entity.imageName {
                                Image(imageName)
                                    .resizable()
                                    .frame(height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black.opacity(0.4))
                                .frame(height: 100)
                            Text(entity.name ?? "Unknown")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            topCardsSetModel.fetchTopCards()
        }
    }
}

#Preview {
    let context = DataControllerModel().container.viewContext
    let dataController = DataControllerModel()
    let topCardsSetModel = TopCardsSetModel(context: context, dataController: dataController)

    return NavigationView {
        TopProgramsView()
            .environmentObject(topCardsSetModel)
    }
}

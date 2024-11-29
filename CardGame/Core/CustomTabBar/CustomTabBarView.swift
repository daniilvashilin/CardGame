//
//  CustomTabBarView.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import SwiftUI
struct CustomTabBarView: View {
    @Binding var selectedTab: Int
    @State var isPlusPressed = false
    @EnvironmentObject var topCardsSetModel: TopCardsSetModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.indigo)
                .frame(width: UIScreen.main.bounds.width * 0.6, height: 80)
            
            HStack(spacing: 20) {
                Button {
                    selectedTab = 1
                } label: {
                    Image(systemName: "house.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .scaleEffect(selectedTab == 1 ? 1.3 : 1.0)
                }
                Button {
                    isPlusPressed = true
                } label: {
                    ZStack {
                        Circle()
                            .fill(.white)
                            .frame(width: 60)
                        Image(systemName: "plus.circle.fill")
                            .font(.custom("", size: 40))
                            .foregroundColor(.indigo)
                        
                    }
                }
                .offset(y: UIScreen.main.bounds.height * -0.04)
                Button {
                    selectedTab = 2
                } label: {
                    Image(systemName: "archivebox.fill")
                        .font(.title)
                        .foregroundColor(.white)
                        .scaleEffect(selectedTab == 2 ? 1.3 : 1.0)
                }
            }
        }
        .frame(height: 80)
        .sheet(isPresented: $isPlusPressed) {
            TopProgramsView()
                           .environmentObject(topCardsSetModel)
        }
    }
}
#Preview {
    CustomTabBarView(selectedTab: .constant(0))
}

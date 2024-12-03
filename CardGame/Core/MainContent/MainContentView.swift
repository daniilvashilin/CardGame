//
//  ContentView.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import SwiftUI

struct MainContentView: View {
    @State private var selectedTab = 1
//    @ObservedObject var deck: UserCustomCardsEntity
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HeaderView()
                Spacer()
                if selectedTab == 1 {
                    Text("1")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    Text("2")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            CustomTabBarView(selectedTab: $selectedTab)
                .padding(.bottom, 20)
        }
    }
}
#Preview {
    MainContentView()
}



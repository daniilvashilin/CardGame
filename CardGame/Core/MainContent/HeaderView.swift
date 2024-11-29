//
//  HeaderView.swift
//  CardGame
//
//  Created by Daniil on 28/11/2024.
//

import SwiftUI

struct HeaderView: View {
    @State var isAvtive = false
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .font(.largeTitle)
                .foregroundStyle(.white)
                .padding()
            Spacer()
            Image(.fireIcon)
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .opacity(isAvtive ? 1.0 : 0.6)
            Text("0")
                .font(.largeTitle).bold()
                .foregroundStyle(.orange)
                .frame(width: 30)
                .padding(.vertical)
            Spacer()
            Image(systemName: "line.3.horizontal")
                .font(.title)
                .foregroundStyle(.white)
                .padding()
        }
        .background(.indigo)
    }
}

#Preview {
    HeaderView()
}



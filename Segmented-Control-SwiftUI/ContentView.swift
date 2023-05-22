//
//  ContentView.swift
//  Segmented-Control-SwiftUI
//
//  Created by Whoami on 21.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 0.4, green: 0.3, blue: 0, alpha: 1)
    }
    
    @State private var selectedSide: SideOfTheForce = .dark
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Choose a Side", selection: $selectedSide) {
                    ForEach(SideOfTheForce.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Spacer()
                ChosenHeroView(selectedSide: selectedSide)
                Spacer()
            }
            .navigationTitle("Choose a Side")
        }
    }
}

enum SideOfTheForce: String, CaseIterable {
    case light = "Light"
    case grey = "Grey"
    case dark = "Dark"
}

struct ChosenHeroView: View {
    
    var selectedSide: SideOfTheForce
    
    var body: some View {
        switch selectedSide {
        case .light:
            HeroImageView(heroName: "anakin")
        case .grey:
            HeroImageView(heroName: "ahsoka")
        case .dark:
            HeroImageView(heroName: "vader")
        }
    }
}

struct HeroImageView: View {
    var heroName: String
    
    var body: some View {
        Image(heroName)
            .resizable()
            .frame(width: 250, height: 400)
            .shadow(color: .white, radius: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

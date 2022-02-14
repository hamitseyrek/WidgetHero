//
//  ContentView.swift
//  WidgetHero
//
//  Created by Hamit Seyrek on 14.02.2022.
//

import SwiftUI

let heroArray = [ironMan, spiderMan, hulk, wonderWomen]

struct ContentView: View {
    
    @AppStorage ("hero", store : UserDefaults(suiteName: "group.com.hamitseyrek.WidgetHero"))
    var heroData : Data = Data()
    
    var body: some View {
        VStack{
            ForEach (heroArray) { hero in
                HeroView(hero: hero)
                    .onTapGesture {
                        saveToUserDefaults(hero: hero)
                    }
            }
        }
    }
    
    func saveToUserDefaults(hero : Hero) {
        if let herodata = try? JSONEncoder().encode(hero) {
            self.heroData = herodata
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

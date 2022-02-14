//
//  ContentView.swift
//  WidgetHero
//
//  Created by Hamit Seyrek on 14.02.2022.
//

import SwiftUI

let heroArray = [ironMan, spiderMan, hulk, wonderWomen]

struct ContentView: View {
    var body: some View {
        VStack{
            ForEach (heroArray) { hero in
                HeroView(hero: hero)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  HeroView.swift
//  WidgetHero
//
//  Created by Hamit Seyrek on 14.02.2022.
//

import SwiftUI

struct HeroView: View {
    
    let hero : Hero
    
    var body: some View {
        HStack {
            CircularImageView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            Spacer()
            VStack{
                Text(hero.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.cyan)
                Text(hero.actor)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero: wonderWomen)
    }
}

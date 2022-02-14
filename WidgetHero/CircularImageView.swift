//
//  CircularImageView.swift
//  WidgetHero
//
//  Created by Hamit Seyrek on 14.02.2022.
//

import SwiftUI

struct CircularImageView: View {
    
    var image : Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.black, lineWidth: 2))
            .shadow(color: Color.green, radius: 10, x: 0, y: 0)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("wonderwomen"))
    }
}

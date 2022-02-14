//
//  Hero.swift
//  WidgetHero
//
//  Created by Hamit Seyrek on 14.02.2022.
//

import Foundation

struct Hero : Identifiable, Codable {
    var id : String {image}
    let image : String
    let actor : String
    let name : String
}

let superMan = Hero(image: "superman", actor: "Clark Joseph Kent", name: "Superman")
let hulk = Hero(image: "hulk", actor: "Dr. Bruce Banner", name: "Hulk")
let wonderWomen = Hero(image: "wonderwomen", actor: "Princess Diana of Themyscira", name: "Wonder Women")
let spiderMan = Hero(image: "spiderman", actor: "Peter Parker", name: "Spider Man")

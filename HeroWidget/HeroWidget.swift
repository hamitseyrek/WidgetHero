//
//  HeroWidget.swift
//  HeroWidget
//
//  Created by Hamit Seyrek on 15.02.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage ("hero", store : UserDefaults(suiteName: "group.com.hamitseyrek.WidgetHero"))
    var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Hero(image: "spiderman", actor: "Peter Parker", name: "SpiderMan"))
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let hero = try? JSONDecoder().decode(Hero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let hero = try? JSONDecoder().decode(Hero.self, from: heroData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero : Hero
}

struct HeroWidgetEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
            .padding()
    }
}

@main
struct HeroWidget: Widget {
    let kind: String = "HeroWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HeroWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Hero Widget")
        .description("This is an example widget.")
    }
}

struct HeroWidget_Previews: PreviewProvider {
    static var previews: some View {
        HeroWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: Hero(image: "spiderman", actor: "Peter Par", name: "Spider")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

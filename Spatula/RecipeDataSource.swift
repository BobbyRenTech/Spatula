//
//  RecipeDataSource.swift
//  Spatula
//
//  Created by Bobby Ren on 8/22/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class RecipeDataSource: NSObject {
    let images: [String] = ["food1",
        "food2",
        "food3",
        "food4",
        "food5",
        "food6",
        "food7",
        "food8",
        "food9",
        "food10",
        "food11",
    ]

    let names = ["Mini fruit tarts",
        "Roast beef sandwich on ciabatta",
        "Scone with rainbow frosting",
        "Cornbread salad",
        "Southwest grilled fajitas",
        "Curry and rice",
        "Strawberry salad",
        "Grilled salmon",
        "Pita with deli meats",
        "Spicy korean stir fry",
        "Duck breast with quail eggs and caviar"
    ]
    
    let descriptions = ["Tasty mini fruit tarts filled with raspberry, strawberry, blueberry, and snozzberry jam",
        "The roast beef is accented by a melty creamy cheese, with the crunch of roast corn.",
        "A classic english breakfast item topped with a classic American favorite: sugar",
        "Mostly cornbread, not so much salad. But it has veggies in it, and is eaten with a spoon.",
        "Grilled chicken breast, peppers, onions in a flour tortilla that never stays closed like that.",
        "Your indian friends will think this is an american food. Your american friends don't know what ethnicity it should be.",
        "Strawberries, beans, corn, and pineapples. Let's be honest, no one's in it for the lettuce.",
        "A bed of broccoli and cauliflower make this meal completely low carb. You can make up for it with ice cream.",
        "Honestly I wasn't sure what this was. It looked kind of like a baklava from certain angles.",
        "The juices on the meat have all been grilled away so we added extra gochujang to make it saucy again.",
        "Everything on this plate is shapeless, formless and is a surprise to your palate. This might actually be a dessert."
    ]
    
    func image(index: Int) -> UIImage {
        return UIImage(named: images[index])!
    }
    
    func name(index: Int) -> String {
        return names[index]
    }
    
    func shortDescriptions(index: Int) -> String {
        return descriptions[index]
    }
    
    func longDesscriptions(index: Int) -> String {
        let short = self.shortDescriptions(index)
        return "\(short) \(short) \(short)"
    }
}

//
//  Photo.swift
//  CollectionAppWithArchitectures
//
//  Created by pavel on 28.11.21.
//

import Foundation

struct Photo {
    let namePhoto: String
    let titlePhoto: String
    let descriptionPhoto: String
    
    static let data = [
        Photo(namePhoto: "dog",
              titlePhoto: "Man's best friend",
              descriptionPhoto: "The dog or domestic dog is a domesticated descendant of the wolf which is characterized by an upturning tail. \nThe dog derived from an ancient, extinct wolf, and the modern grey wolf is the dog's nearest living relative. \nThe dog was the first species to be domesticated, by hunter–gatherers over 15,000 years ago, before the development of agriculture. \nThe dog has been selectively bred over millennia for various behaviors, sensory capabilities, and physical attributes. \nDog breeds vary widely in shape, size, and color. They perform many roles for humans, such as hunting, herding, pulling loads, protection, assisting police and the military, companionship, therapy, and aiding disabled people. This influence on human society has given them the sobriquet of \"man's best friend.\""),
        Photo(namePhoto: "minsk",
              titlePhoto: "Minsk",
              descriptionPhoto: "Minsk is the capital and the largest city of Belarus, located on the Svislach and the now subterranean Niamiha rivers. \nAs the capital, Minsk has a special administrative status in Belarus and is the administrative centre of Minsk Region and Minsk District. \nAs of January 2021, its population was 2,009,786 (not including suburbs), making Minsk the 11th most populous city in Europe. \nMinsk is the administrative capital of the Commonwealth of Independent States (CIS) and seat of its Executive Secretary."),
        Photo(namePhoto: "bird",
              titlePhoto: "Swift(bird)",
              descriptionPhoto: "Swifts are among the fastest of birds, and larger species like the white-throated needletail have been reported travelling at up to 169 km/h (105 mph) in level flight. \nEven the common swift can cruise at a maximum speed of 31 metres per second (112 km/h; 70 mph). \nIn a single year the common swift can cover at least 200,000 km, and in a lifetime, about two million kilometers; enough to fly to the Moon and back five times over."),
        Photo(namePhoto: "apple",
              titlePhoto: "Apple",
              descriptionPhoto: "An apple is an edible fruit produced by an apple tree (Malus domestica). Apple trees are cultivated worldwide and are the most widely grown species in the genus Malus. \nThe tree originated in Central Asia, where its wild ancestor, Malus sieversii, is still found today. \nApples have been grown for thousands of years in Asia and Europe and were brought to North America by European colonists. \nApples have religious and mythological significance in many cultures, including Norse, Greek, and European Christian tradition."),
        Photo(namePhoto: "programming",
              titlePhoto: "Programming",
              descriptionPhoto: "Computer programming is the process of designing and building an executable computer program to accomplish a specific computing result or to perform a particular task. \nProgramming involves tasks such as analysis, generating algorithms, profiling algorithms' accuracy and resource consumption, and the implementation of algorithms in a chosen programming language (commonly referred to as coding). \nThe source code of a program written in one or more languages that are intelligible to programmers, rather than machine code, which is directly executed by the central processing unit. \nThe purpose of programming is to find a sequence of instructions that will automate the performance of a task (which can be as complex as an operating system) on a computer, often for solving a given problem. Proficient programming thus usually requires expertise in several different subjects, including knowledge of the application domain, specialized algorithms, and formal logic."),
        Photo(namePhoto: "coffee",
              titlePhoto: "Coffee",
              descriptionPhoto: "Coffee is a brewed drink prepared from roasted coffee beans, the seeds of berries from certain Coffea species. \nAll fruit must be further processed from a raw material the fruit and seed into a stable, raw product; unroasted, green coffee. \nTo process the berries, the seed is separated from the fruit to produce green coffee. \nGreen coffee is then roasted, a process which transforms the raw product (green coffee) into a consumable product (roasted coffee). \nRoasted coffee is ground into a powder and mixed with water to produce a cup of coffee."),
        Photo(namePhoto: "jobs",
              titlePhoto: "Steven Jobs",
              descriptionPhoto: "Steven Paul Jobs was an American business magnate, industrial designer, investor, and media proprietor. \nHe was the chairman, chief executive officer (CEO), and co-founder of Apple Inc.; the chairman and majority shareholder of Pixar; a member of The Walt Disney Company's board of directors following its acquisition of Pixar; and the founder, chairman, and CEO of NeXT. \nJobs is widely recognized as a pioneer of the personal computer revolution of the 1970s and 1980s, along with his early business partner and fellow Apple co-founder Steve Wozniak."),
        Photo(namePhoto: "tesla",
              titlePhoto: "Tesla",
              descriptionPhoto: "Tesla, Inc. is an American electric vehicle and clean energy company based in Palo Alto, California, United States. \nTesla designs and manufactures electric cars, battery energy storage from home to grid-scale, solar panels and solar roof tiles, and related products and services. \nIn 2020, Tesla had the most sales of battery electric vehicles and plug-in electric vehicles, capturing 16% of the plug-in market (which includes plug-in hybrids) and 23% of the battery-electric (purely electric) market."),
        Photo(namePhoto: "iphone",
              titlePhoto: "iPhone",
              descriptionPhoto: "The iPhone is a line of smartphones designed and marketed by Apple Inc. that use Apple's iOS mobile operating system. \nThe first-generation iPhone was announced by then-Apple CEO Steve Jobs on January 9, 2007. \nSince then, Apple has annually released new iPhone models and iOS updates. \nAs of November 1, 2018, more than 2.2 billion iPhones had been sold."),
        Photo(namePhoto: "park",
              titlePhoto: "Apple Park",
              descriptionPhoto: "Apple Park is the corporate headquarters of Apple Inc., located in Cupertino, California. \nIt was opened to employees in April 2017, while construction was still underway, and superseded the original headquarters at 1 Infinite Loop, which opened in 1993. \nThe main building's scale and circular groundscraper design, by Norman Foster, have earned the structure a media nickname \"the spaceship\". \nLocated on a suburban site totalling 1.46 km2, it houses more than 12,000 employees in one central four-story circular building of approximately 0.26 km2. \nApple co-founder Steve Jobs wanted the campus to look less like a business park and more like a nature refuge. Eighty percent of the site consists of green space planted with drought-resistant trees and plants indigenous to the Cupertino area, and the center courtyard of the main building features an artificial pond.")
    ]
    
    func getData() -> [Photo] {
        let photosArray = [Photo]()
        return photosArray
    }
}

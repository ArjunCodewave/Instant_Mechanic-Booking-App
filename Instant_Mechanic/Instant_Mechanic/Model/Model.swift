//
//  Model.swift
//  Instant_Mechanic
//
//  Created by Arjun Rana on 02/09/26.
//

struct Task: Codable, Identifiable {
    
    let product_id: Int
    var id: Int {
            product_id
        }
    let name: String?
    let description: String?
    //let price: Double?
    let unit: String?
    let image: String?
    let discount: Int?
    let isOpen : Bool?
    //let brand: String?
    //let category: String?
    let rating: Double?
    let location: String?
    let distance : Double?
    let experience: Int?
    let noOfServices : Int?
    let noOfcars : Int?
    enum CodingKeys: String, CodingKey {
            case product_id
            case name
            case description
            case unit
            case image
            case discount
            case isOpen
            case rating
            case location
            case distance
            case experience
            case noOfServices = "no_of_services"
            case noOfcars = "no_of_cars"
        }
    
}
//struct Product: Codable {
//    let noOfServices: Int
//    let noOfcars:Int
//
//    enum CodingKeys: String, CodingKey {
//        case noOfServices = "no.ofservices"
//        case noOfcars = "no.ofcars"
//    }
//}

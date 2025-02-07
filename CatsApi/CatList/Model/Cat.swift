//
//  StructCat.swift
//  CatsApi
//
//  Created by Mauricio Rodriguez on 6/2/2025.
//

import Foundation


struct Cat: Identifiable, Codable {
    let id: String
    let url: String
    let breeds: [Breed]?
}

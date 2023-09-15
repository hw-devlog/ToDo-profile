//
//  model.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/13.
//

import Foundation

struct Todo: Codable {
    var title: String
    var content: String
    var done: Bool
}

struct RandomImage: Codable {
    let url: String
}



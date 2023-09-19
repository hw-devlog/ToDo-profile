//
//  model.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/13.
//

import Foundation
class Todo: Codable {
    var title: String
    var content: String
    var done: Bool
    var section: String
    
    init(title: String, content: String, done: Bool, section: String) {
           self.title = title
           self.content = content
           self.done = done
           self.section = section
       }
}

struct RandomImage: Codable {
    let url: String
}



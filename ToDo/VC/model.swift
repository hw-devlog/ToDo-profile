//
//  model.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/13.
//

import Foundation
class Todo: Codable {
    var id: Int
    var title: String
    var content: String
    var done: Bool
    var section: String
    
    init(id: Int, title: String, content: String, done: Bool, section: String) {
        self.id = id
           self.title = title
           self.content = content
           self.done = done
           self.section = section
       }
}

struct RandomImage: Codable {
    let url: String
}

extension Todo: Equatable {
    static func ==(lhs: Todo, rhs: Todo) -> Bool {
        // 두 개의 Todo 객체를 비교하여 같은지 여부를 확인합니다.
        // 예: 할 일의 식별자가 같으면 같은 객체로 간주
        return lhs.id == rhs.id
    }
}



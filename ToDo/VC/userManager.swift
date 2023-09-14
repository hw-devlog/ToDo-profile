//
//  userManager.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/14.
//

import Foundation

struct userManager {
    static let shared = userManager()
    static let userDefaults = UserDefaults.standard
    
    static var todoList: [Todo] =
    [
        Todo(title: "1", content: "1", done: true),
        Todo(title: "2", content: "2", done: false)
    ]
    
    static func loadTodo() {
        if let data = userDefaults.data(forKey: "todoList"),
           let loadData = try? JSONDecoder().decode([Todo].self, from: data) {
            todoList = loadData
        }
    }
    
    static func addTodo(_ newTodo: Todo) {
        var updatedTodo = todoList
        updatedTodo.append(newTodo)
        todoList = updatedTodo
        saveTodo(newTodo)
        loadTodo()
    }
    
    static func saveTodo(_ saveTodo: Todo) {
        if let saveData = try? JSONEncoder().encode(todoList) {
            userDefaults.set(saveData, forKey: "todoList")
        }
    }
}

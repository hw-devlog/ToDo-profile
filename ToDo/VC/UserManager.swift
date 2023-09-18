//
//  userManager.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/14.
//

import Foundation

class UserManager {
    static let shared = UserManager()
    let userDefaults = UserDefaults.standard
    private init() {}
     var lifetodoList: [Todo] = [Todo(title: "1", content: "1", done: true),
                             Todo(title: "2", content: "2", done: false)]
     var worktodoList: [Todo] = [Todo(title: "1", content: "1", done: true),
                                Todo(title: "2", content: "2", done: false)]
    
     let sections = ["life", "work"]
    
    func saveLifeTodo(_ saveTodo: Todo) {
       if let data = try? JSONEncoder().encode(lifetodoList) {
           userDefaults.set(data, forKey: "lifetodoList")
       }
   }
    
     func loadLifeTodo() {
         if let data = userDefaults.data(forKey: "lifetodoList"),
           let loadData = try? JSONDecoder().decode([Todo].self, from: data) {
             lifetodoList = loadData
        }
    }
    
     func addLifeTodo(_ newTodo: Todo) {
        var updatedTodo = lifetodoList
        updatedTodo.append(newTodo)
         lifetodoList = updatedTodo
        saveLifeTodo(newTodo)
        loadLifeTodo()
    }
    
    func saveWorkTodo(_ saveTodo: Todo) {
       if let data = try? JSONEncoder().encode(worktodoList) {
           userDefaults.set(data, forKey: "worktodoList")
       }
   }
    
     func loadWorkTodo() {
         if let data = userDefaults.data(forKey: "worktodoList"),
           let loadData = try? JSONDecoder().decode([Todo].self, from: data) {
             worktodoList = loadData
        }
    }
    
     func addWorkTodo(_ newTodo: Todo) {
        var updatedTodo = worktodoList
        updatedTodo.append(newTodo)
         worktodoList = updatedTodo
         saveWorkTodo(newTodo)
         loadWorkTodo()
    }
    
    
    
}

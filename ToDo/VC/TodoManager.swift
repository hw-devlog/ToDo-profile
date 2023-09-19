//
//  userManager.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/14.
//

import Foundation

class TodoManager {
    static let shared = TodoManager()
     let userDefaults = UserDefaults.standard
    private init() {}
    
     var lifetodoList: [Todo] = []
     var worktodoList: [Todo] = []

     let sections = ["Life", "Work"]

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
         if let data = userDefaults.data(forKey: "worktodoList") {
               do {
                   let loadData = try JSONDecoder().decode([Todo].self, from: data)
                   worktodoList = loadData
                   print("Work todo loaded successfully: \(worktodoList)")
               } catch {
                   print("Error decoding worktodoList: \(error)")
               }
           } else {
               print("No work todo data found")
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

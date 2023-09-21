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
    private init() { // 이니셜라이저
        // 저장된 데이터를 로드하는 로직 추가
        loadWorkTodo()
        loadLifeTodo()
        loadDoneTodos()
        
    }
    
     var lifetodoList: [Todo] = []
     var worktodoList: [Todo] = []
     var doneTodos: [Todo] = []
    
     let sections = ["Life", "Work"]

     func saveLifeTodo() {
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
        saveLifeTodo()
        loadLifeTodo()
    }

     func saveWorkTodo() {
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
         saveWorkTodo()
         loadWorkTodo()
    }
    func moveCompletedTodosToDone() {
        // 완료된 작업을 모으기 위한 빈 배열
        var completedTodos: [Todo] = []

        // worktodoList에서 완료된 작업을 가져와서 completedTodos에 추가
        worktodoList.removeAll { todo in
            if todo.done {
                completedTodos.append(todo)
                return true // 삭제할 항목
            }
            return false // 유지할 항목
        }

        // lifetodoList에서 완료된 작업을 가져와서 completedTodos에 추가
        lifetodoList.removeAll { todo in
            if todo.done {
                completedTodos.append(todo)
                return true // 삭제할 항목
            }
            return false // 유지할 항목
        }

        // completedTodos를 doneTodos에 추가
        doneTodos.append(contentsOf: completedTodos)

        // completedTodos를 UserDefaults에 저장
        saveDoneTodos()
    }
 
    func saveDoneTodos() {
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(doneTodos)
            UserDefaults.standard.set(encodedData, forKey: "doneTodos")
        } catch {
            print("Error encoding doneTodos: \(error)")
        }
    }
    func loadDoneTodos() {
        if let data = UserDefaults.standard.data(forKey: "doneTodos") {
            do {
                let decoder = JSONDecoder()
                let loadedData = try decoder.decode([Todo].self, from: data)
                doneTodos = loadedData
            } catch {
                print("Error decoding doneTodos: \(error)")
            }
        }
    }
    
    func removeTodoFromWorkList(at index: Int) {
        if index >= 0 && index < worktodoList.count {
            worktodoList.remove(at: index)
            // 수정: 작업을 삭제한 후에 데이터 저장
            saveWorkTodo()
        }
    }

    func removeTodoFromLifeList(at index: Int) {
        if index >= 0 && index < lifetodoList.count {
            lifetodoList.remove(at: index)
            // 수정: 작업을 삭제한 후에 데이터 저장
            saveLifeTodo()
        }
    }
}

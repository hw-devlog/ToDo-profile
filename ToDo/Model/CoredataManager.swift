//
//  CoredataModel.swift
//  ToDo
//
//  Created by Hyunwoo Lee on 2023/09/24.
//

// Core Data에서 관리되는 데이터베이스 컨텍스트 가져오기
import CoreData
import UIKit

class CoreDataManager {
    // Singleton 인스턴스
    static let shared = CoreDataManager()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    // 데이터를 추가하는 메서드
    func createTask(title: String, content: String, isCompleted: Bool, section: String) {
        let context = appDelegate.persistentContainer.viewContext
        let newTask = Tasks(context: context)
        newTask.title = title
        newTask.content = content
        newTask.iscompleted = isCompleted
        newTask.section = section

        saveContext()
    }

    // 모든 데이터를 읽어오는 메서드
    func fetchAllTasks() -> [Tasks] {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()

        do {
            let tasks = try context.fetch(fetchRequest)
            return tasks
        } catch {
            print("데이터 읽기 실패: \(error)")
            return []
        }
    }

    // 데이터를 수정하는 메서드
    func updateTask(_ task: Tasks) {
        saveContext()
    }

    // 데이터를 삭제하는 메서드
    func deleteTask(_ task: Tasks) {
        let context = appDelegate.persistentContainer.viewContext
        context.delete(task)
        saveContext()
    }

    // 변경 사항을 저장하는 메서드
    func saveContext() {
        let context = appDelegate.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("데이터 저장 실패: \(error)")
            }
        }
    }
    func fetchTasksInSection(_ section: String) -> [Tasks] {
        let context = appDelegate.persistentContainer.viewContext
           let fetchRequest: NSFetchRequest<Tasks> = Tasks.fetchRequest()
           fetchRequest.predicate = NSPredicate(format: "section == %@", section)
        fetchRequest.predicate = NSPredicate(format: "section == %@ AND iscompleted == false", section)
           do {
               let tasks = try context.fetch(fetchRequest)
               return tasks
           } catch {
               print("데이터 읽기 실패: \(error)")
               return []
           }
       }
}

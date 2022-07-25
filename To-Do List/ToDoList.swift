//
//  File.swift
//  To-Do List
//
//  Created by Ali on 25/07/2022.
//

import Foundation

class ToDoList: ObservableObject {
    @Published var items : [ToDoList] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encoder(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
}
init() {
    if let items = UserDefaults.standard.data(forKey: "data") {
        let decoder = JSONDecoder()
        if let decoded = try? decoder.decode([ToDoList].self, from: items) {
            self.items = decoded
            return
        }
    }
    items = []
}

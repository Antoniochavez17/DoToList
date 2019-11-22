//
//  File.swift
//  ToDoList
//
//  Created by Antonio Adrian Chavez on 11/22/19.
//  Copyright © 2019 Antonio Adrian Chavez. All rights reserved.
//

import Foundation


class ToDoList {
    
    var title: String
    var done: Bool
    
    
    public init(title: String) {
        
        self.title = title
        self.done = false
        
    }
    
}

extension ToDoList {
    
    public class func getMockData() -> [ToDoList] {
        
        return [
           ToDoList(title: "Milk"),
           ToDoList(title: "Water"),
           ToDoList(title: "Pen")
            
        ]
        
    }
    
    
    
    
}

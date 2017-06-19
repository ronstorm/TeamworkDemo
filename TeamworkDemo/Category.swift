//
//  Category.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import ObjectMapper

typealias CategoryArray = [Category]

class CategoryList: Mappable {
    private struct Key {
        let status_key = "STATUS"
        let categories_key = "categories"
    }
    
    internal var status: String?
    internal var categories: CategoryArray?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        mapping(map: map)
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        status <- map[key.status_key]
        categories <- map[key.categories_key]
    }
}

class Category: Mappable {
    private struct Key {
        let parent_id_key = "parent-id"
        let name_key = "name"
        let count_key = "count"
        let elements_count_key = "elements-count"
        let id_key = "id"
        let type_key = "type"
    }
    
    internal var parentId: String?
    internal var name: String?
    internal var count: String?
    internal var elementsCount: String?
    internal var id: String?
    internal var type: String?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        parentId <- map[key.parent_id_key]
        name <- map[key.name_key]
        count <- map[key.count_key]
        elementsCount <- map[key.elements_count_key]
        id <- map[key.id_key]
        type <- map[key.type_key]
    }
}

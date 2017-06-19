//
//  Project.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import ObjectMapper

typealias ProjectArray = [Project]

class ProjectList: Mappable {
    private struct Key {
        let status_key = "STATUS"
        let projects_key = "projects"
    }
    
    internal var status: String?
    internal var projects: ProjectArray?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        mapping(map: map)
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        status <- map[key.status_key]
        projects <- map[key.projects_key]
    }
}

class Project: Mappable {
    private struct Key {
        let company_key = "company"
        let starred_key = "starred"
        let name_key = "name"
        let show_announcement_key = "show-announcement"
        let announcement_key = "announcement"
        let description_key = "description"
        let status_key = "status"
        let isProjectAdmin_key = "isProjectAdmin"
        let created_on_key = "created-on"
        let category_key = "category"
        let start_page_key = "start-page"
        let startDate_key = "startDate"
        let logo_key = "logo"
        let notifyeveryone_key = "notifyeveryone"
        let id_key = "id"
        let last_changed_on_key = "last-changed-on"
        let endDate_key = "endDate"
        let harvest_timers_enabled_key = "harvest-timers-enabled"
        let replyByEmailEnabled_key = "replyByEmailEnabled"
        let subStatus_key = "subStatus"
        let defaultPrivacy_key = "defaultPrivacy"
        let overview_start_page_key = "overview-start-page"
        let tasks_start_page_key = "tasks-start-page"
        let privacyEnabled_key = "privacyEnabled"
        let tags_key = "tags"
    }
    
    internal var company: ProjectCompanyItem?
    internal var isStarred: Bool?
    internal var name: String?
    internal var isShowAnnouncement: Bool?
    internal var announcement: String?
    internal var description: String?
    internal var status: String?
    internal var isProjectAdmin: Bool?
    internal var createdOn: String?
    internal var category: ProjectCategoryItem?
    internal var startPage: String?
    internal var startDate: String?
    internal var logoUrl: String?
    internal var isNotifyEveryone: Bool?
    internal var id: String?
    internal var lastChangedOn: String?
    internal var endDate: String?
    internal var isHarvestTimersEnabled: String?
    internal var isReplyByEmailEnabled: Bool?
    internal var subStatus: String?
    internal var defaultPrivacy: String?
    internal var overviewStartPage: String?
    internal var taskStartPage: String?
    internal var isPrivacyEnabled: Bool?
    internal var tags: [ProjectTagItem]?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        mapping(map: map)
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        company <- map[key.company_key]
        isStarred <- map[key.starred_key]
        name <- map[key.name_key]
        isShowAnnouncement <- map[key.show_announcement_key]
        announcement <- map[key.announcement_key]
        description <- map[key.description_key]
        status <- map[key.company_key]
        isStarred <- map[key.status_key]
        isProjectAdmin <- map[key.isProjectAdmin_key]
        createdOn <- map[key.created_on_key]
        category <- map[key.category_key]
        startPage <- map[key.start_page_key]
        startDate <- map[key.startDate_key]
        logoUrl <- map[key.logo_key]
        isNotifyEveryone <- map[key.notifyeveryone_key]
        id <- map[key.id_key]
        lastChangedOn <- map[key.last_changed_on_key]
        endDate <- map[key.endDate_key]
        isHarvestTimersEnabled <- map[key.harvest_timers_enabled_key]
        isReplyByEmailEnabled <- map[key.replyByEmailEnabled_key]
        subStatus <- map[key.subStatus_key]
        defaultPrivacy <- map[key.defaultPrivacy_key]
        overviewStartPage <- map[key.overview_start_page_key]
        taskStartPage <- map[key.tasks_start_page_key]
        isPrivacyEnabled <- map[key.privacyEnabled_key]
        tags <- map[key.tags_key]
    }
}

class ProjectCompanyItem: Mappable {
    private struct Key {
        let name_key = "name"
        let is_owner_key = "is-owner"
        let id_key = "id"
    }
    
    internal var name: String?
    internal var isOwner: Bool?
    internal var id: String?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        name <- map[key.name_key]
        isOwner <- map[key.is_owner_key]
        id <- map[key.id_key]
    }
}

class ProjectCategoryItem: Mappable {
    private struct Key {
        let name_key = "name"
        let id_key = "id"
        let color_key = "color"
    }
    
    internal var name: String?
    internal var id: String?
    internal var color: String?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        mapping(map: map)
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        name <- map[key.name_key]
        color <- map[key.color_key]
        id <- map[key.id_key]
    }
}

class ProjectTagItem: Mappable {
    private struct Key {
        let name_key = "name"
        let id_key = "id"
        let color_key = "color"
    }
    
    internal var name: String?
    internal var id: String?
    internal var color: String?
    
    internal init() {
        
    }
    
    required internal init(map: Map) {
        mapping(map: map)
    }
    
    internal func mapping(map: Map) {
        let key = Key.init()
        
        name <- map[key.name_key]
        color <- map[key.color_key]
        id <- map[key.id_key]
    }
}

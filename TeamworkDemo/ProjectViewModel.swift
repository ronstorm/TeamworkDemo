//
//  ProjectViewModel.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import Bond
import PKHUD
import ReactiveKit
import Alamofire
import ObjectMapper

class ProjectViewModel {
    private var projectListApiPath = "projects.json"
    
    let teamworkApp = TeamworkApp.sharedInstance
    
    let fullProjectList = MutableObservableArray<Project>([])
    let errorMessage = PublishSubject<(String, String), NoError>()
    
    init(catId: String) {
        if catId != "" {
            projectListApiPath = projectListApiPath + "?catId=\(catId)"
        }
        getAllProjects()
    }
    
    func getAllProjects() {
        HUD.show(.progress)
        
        teamworkApp.apiService.fetchAPIData(partialURL: projectListApiPath, method: .get, params: [:], returningType: ProjectList.self) { (result) in
            HUD.hide()
            switch result {
            case .success(let projectList):
                self.fullProjectList.removeAll()
                self.fullProjectList.insert(contentsOf: (projectList.projects)!, at: 0)
                break
            case .error(let error):
                self.teamworkApp.appHelper.emitErrorMessage(error: error, errorMsg: self.errorMessage, errorTexts: self.teamworkApp.errorTexts)
                break
            }
        }
        
    }
}

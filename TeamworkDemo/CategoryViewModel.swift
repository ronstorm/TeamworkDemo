//
//  CategoryViewModel.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit
import PKHUD

class CategoryViewModel {
    private let categoryListApiPath = "projectCategories.json"
    
    let teamworkApp = TeamworkApp.sharedInstance
    
    let fullCategoryList = MutableObservableArray<Category>([])
    let errorMessage = PublishSubject<(String, String), NoError>()
    
    init() {
        getAllCategories()
    }
    
    func getAllCategories() {
        HUD.show(.progress)
        
        teamworkApp.apiService.fetchAPIData(partialURL: categoryListApiPath, method: .get, params: [:], returningType: CategoryList.self) { (result) in
            HUD.hide()
            switch result {
            case .success(let categoryList):
                self.fullCategoryList.removeAll()
                self.fullCategoryList.insert(contentsOf: (categoryList.categories)!, at: 0)
                break
            case .error(let error):
                self.teamworkApp.appHelper.emitErrorMessage(error: error, errorMsg: self.errorMessage, errorTexts: self.teamworkApp.errorTexts)
                break
            }
        }
    }
}

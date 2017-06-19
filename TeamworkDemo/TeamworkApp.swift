//
//  TeamworkApp.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation

public class TeamworkApp {
    
    static let sharedInstance = TeamworkApp()
    
    var baseURL: String {
        let urlStrings = AppConstants.URLStrings.init()
        return urlStrings.baseURL
    }
    let appHelper = AppHelper.init()
    let apiService = APIService.init()
    let errorTexts = AppConstants.ErrorTexts.init()
    
    private init() {
    }
}

//
//  AppConstants.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation

class AppConstants {
    struct URLStrings {
        let baseURL = "https://knockkdoc.teamwork.com/"
    }
    
    struct ErrorTexts {
        let requestErrorTitle = "Bad Request!"
        let responseErrorTitle = "Parse Error!"
        let serverErrorTitle = "Server Error!"
        
        let requestErrorText = "Please, check your request parameters!"
        let responseErrorText = "Something went wrong with parsing response data!"
        let serverErrorText = "Something went wrong on the Server Side."
    }
}

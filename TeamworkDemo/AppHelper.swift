//
//  AppHelper.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import ReactiveKit

class AppHelper {
    
    init() {
    }
    
    func emitErrorMessage(error: TWError, errorMsg: PublishSubject<(String, String), NoError>, errorTexts: AppConstants.ErrorTexts) {
        switch error {
        case .requestError:
            errorMsg.next(errorTexts.requestErrorTitle, errorTexts.requestErrorText)
            break
        case .responseError:
            errorMsg.next(errorTexts.responseErrorTitle, errorTexts.responseErrorText)
            break
        case .serverError:
            errorMsg.next(errorTexts.serverErrorTitle, errorTexts.serverErrorText)
            break
        }
    }

}

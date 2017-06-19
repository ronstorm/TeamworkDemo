//
//  Result.swift
//  TeamworkDemo
//
//  Created by Bluscheme on 6/17/17.
//  Copyright © 2017 RonStorm Inc. All rights reserved.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case error(TWError)
}

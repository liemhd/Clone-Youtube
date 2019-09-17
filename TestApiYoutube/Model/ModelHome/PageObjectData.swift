//
//  PageObjectData.swift
//  TestApiYoutube
//
//  Created by Apple on 7/13/19.
//  Copyright © 2019 DuyLiem. All rights reserved.
//

import Foundation

final class PageObjectData {
    var totalResults: Int?
    var resultsPerPage: Int?
    
    init(totalResults: Int , resultsPerPage: Int) {
        self.totalResults = totalResults
        self.resultsPerPage = resultsPerPage
    }
}

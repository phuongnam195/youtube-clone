//
//  PagedList.swift
//  Youtube Clone
//
//  Created by Phuong Nam on 29/6/24.
//

import Foundation

class PagedList<T> {
    var currentPage: Int
    var totalPages: Int
    var limit: Int
    var items: [T]
    
    init(limit: Int) {
        self.currentPage = 0
        self.totalPages = 0
        self.limit = limit
        self.items = []
    }
}

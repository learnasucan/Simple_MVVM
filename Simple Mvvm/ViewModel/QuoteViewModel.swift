//
//  QuoteViewModel.swift
//  Simple Mvvm
//
//  Created by Prachit on 11/05/22.
//

import Foundation

typealias VoidHandler =  () -> Void

protocol QuoteViewModelService {
    var quotes: [Quotes]? { get }
    func getQuotes()
    var loadSuccess: VoidHandler? { get set }
}

class QuoteViewModel: QuoteViewModelService {    
    var loadSuccess: VoidHandler?
    var quotes: [Quotes]?
    
    func getQuotes() {
        APISource.getQuotes { [weak self] quotes in
            print(quotes.count)
            self?.quotes = quotes
            self?.loadSuccess?()
        }
    }
}

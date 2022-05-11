//
//  QuoteViewModel.swift
//  Simple Mvvm
//
//  Created by Prachit on 11/05/22.
//

import Foundation

typealias VoidHandler =  () -> Void

protocol QuoteViewModelService {
    var quotesCellVM: [QuoteCellVM] { get }
    func getQuotes()
    var loadSuccess: VoidHandler? { get set }
}

class QuoteViewModel: QuoteViewModelService {    
    var loadSuccess: VoidHandler?
    var quotesCellVM = [QuoteCellVM]()
    
    func getQuotes() {
        APISource.getQuotes { [weak self] (_,quotes)  in
            self?.quotesCellVM = quotes.map {QuoteCellVM(quoteText: $0.quote, authorText: $0.author)}
            self?.loadSuccess?()
        }
    }
}

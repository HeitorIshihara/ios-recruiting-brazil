//
//  DateFilterPresenter.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 10/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import Foundation

class DateFilterPresenter: DateFilterPresentation, DateFilterInteractorOutput {
    
    // MARK: - Properties
    var view: DateFilterView?
    var interactor: DateFilterInteractorInput!
    var router: DateFilterWireframe!
    
    
    // MARK: - DateFilterPresentation functions
    func viewDidLoad() {
        self.interactor.getDates()
    }

    // MARK: - DateFilterInteractorOutput functions
    func didGetDates(dates: [Date]) {
        self.view?.showDates(dates: dates)
    }
}

//
//  FilterPresenter.swift
//  ConcreteChallenge
//
//  Created by Heitor Ishihara on 10/11/18.
//  Copyright © 2018 Heitor Ishihara. All rights reserved.
//

import Foundation

class FilterPresenter: FilterPresentation, FilterInteractorOutput {
    
    
    // MARK: - Properties
    var view: FilterView?
    var interactor: FilterInteractorInput!
    var router: FilterWireframe!
    
    // MARK: - FilterPresentation functions
    func viewDidLoad() {
        self.interactor.getDateFilter()
        self.interactor.getGenreFilter()
    }
    
    func didTapCancelButton() {
        self.interactor.removeFilters()
        self.router.exitFilter()
    }
    
    func didTapDoneButton() {
        self.router.doneFilter()
    }
    
    func didTapDateButton() {
        self.router.showDateFilter()
    }
    
    func didTapGenreButton() {
        self.router.showGenreFilter()
    }
    
    func didSetDateFilter() {
        self.interactor.getDateFilter()
    }
    
    func didSetGenreFilter() {
        self.interactor.getGenreFilter()
    }
    
    // MARK: - FilterInteractorOutput functions
    func didGetDateFilter(dates: [Date]) {
        self.view?.updateDateFilterIndicator(with: dates)
    }
    
    func didGetGenreFilter(genres: [Genre]) {
        self.view?.updateGenreFilterIndicator(with: genres)
    }
}

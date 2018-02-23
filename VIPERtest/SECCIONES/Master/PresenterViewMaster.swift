//
//  PresenterViewMaster.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 17/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation

protocol PresenterMasterControllerProtocol : class {
    var arrayMovies : [DataEntitie]? { get set }
    func numberOfItemsInSection(_ section : Int) -> Int
    func informationForItemAtIndexPath(_ indexPath : IndexPath) -> DataEntitie
}


final class PresenterMasterController :  NSObject, PresenterMasterControllerProtocol {
    
    var presenterMasterControllerProtocol: PresenterMasterControllerProtocol?
    fileprivate var interactor : InteractorMasterControllerProtocol!
    var arrayMovies : [DataEntitie]?

    
    override init() {
        super.init()
        self.presenterMasterControllerProtocol = self
        self.interactor = InteractorMasterController()
    }
    
    internal func viewDidLoad() {
        self.arrayMovies = []
        self.fetchDataFromProvider()
    }
    
    
    internal func fetchDataFromProvider() {
        interactor.getDataFromApple { (result) in
            guard let resultDes = result else { return }
            self.presenterMasterControllerProtocol?.arrayMovies = resultDes
        }
    }
    
    func numberOfItemsInSection(_ section : Int) -> Int{
        return arrayMovies!.count
    }

    func informationForItemAtIndexPath(_ indexPath : IndexPath) -> DataEntitie {
        return (arrayMovies![indexPath.row])
    }
    
    
   
}





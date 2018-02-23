//
//  InteractorMasterController.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 17/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol InteractorMasterControllerProtocol : class {
    func getDataFromApple(_ completion: @escaping ([DataEntitie]?) -> ())
}


final class InteractorMasterController : NSObject, InteractorMasterControllerProtocol {
    
    var interactorMasterControllerProtocol : InteractorMasterControllerProtocol?
    
    override init() {
        super.init()
        self.interactorMasterControllerProtocol = self
    }
    
    internal func getDataFromApple(_ completion: @escaping ([DataEntitie]?) -> ()) {
        guard let url = URL(string: CONSTANTES.LLAMADAS.BASE_URL) else { return }
        Alamofire.request(url,
                          method: .get).validate().responseJSON { (responseData) in
                            switch responseData.result{
                            case .success:
                                guard let valorData = responseData.result.value else{return}
                                let jsonData : JSON?
                                jsonData = JSON(valorData)
                                if let jsonDatDes = jsonData{
                                    var resultData = [DataEntitie]()
                                    for c_result in jsonDatDes["feed"]["results"].arrayValue{
                                        let movieDicionary = DataEntitie(json: c_result)
                                        resultData.append(movieDicionary)
                                    }
                                    completion(resultData)
                                }
                            case . failure(let error):
                                print("Error: \(error.localizedDescription)")
                                completion(nil)
                            }
        }
    }
    
}

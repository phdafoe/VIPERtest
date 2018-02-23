//
//  ViewMasterController.swift
//  VIPERtest
//
//  Created by Andres Felipe Ocampo Eljaiesk on 17/2/18.
//  Copyright © 2018 icologic. All rights reserved.
//

import UIKit

class ViewMasterController: UIViewController{
    
    var arrayMovies: [DataEntitie]? = [] {
        didSet{
            self.myTableView.reloadData()
        }
    }
    
    var presenter : PresenterMasterController!
    
    //MARK: - IBOutlet
    @IBOutlet weak var myTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PresenterMasterController()
        self.presenter.viewDidLoad()
//        self.arrayData = self.presenter.presenterMasterControllerProtocol?.arrayMovies
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        
        myTableView.register(UINib(nibName: TableViewCell.defaultIdentifier, bundle: nil), forCellReuseIdentifier: TableViewCell.defaultIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewMasterController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter.presenterMasterControllerProtocol?.arrayMovies?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: TableViewCell.defaultIdentifier, for: indexPath) as! TableViewCell
        
        let model = presenter.presenterMasterControllerProtocol?.informationForItemAtIndexPath(indexPath)
        
        cell.myLabelTitle.text = model?.artistName
        
        return cell
    }
    
    
    
}



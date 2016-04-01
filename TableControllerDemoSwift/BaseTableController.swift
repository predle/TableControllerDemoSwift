//
//  BaseTableController.swift
//  TableControllerDemoSwift
//
//  Created by Beomseok Seo on 4/1/16.
//  Copyright © 2016 Predle. All rights reserved.
//

import UIKit

protocol BaseTableControllerDelegate {
    
}

class BaseTableController<C: UITableViewCell, T: BaseModel>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var content: [T] = []
    
    //
    
    private var delegate: BaseTableControllerDelegate?
    private weak var tableView: UITableView?
    private var bindWithModel: (tableViewCell: C, model: T) -> () = { tableViewCell, model in
        
    }
    private var didSelectCell: (tableViewCell: C, model: T) -> () = { tableViewCell, model in

    }
    private var cellIdentifier: String?

    //
    
    init(tableView: UITableView, delegate: BaseTableControllerDelegate, bindWithModel: (tableViewCell: C, model: T) -> (), didSelectCell: (tableViewCell: C, model: T) -> ()) {
        super.init()
        
        self.didSelectCell = didSelectCell
        self.bindWithModel = bindWithModel
        
        self.tableView = tableView
        self.delegate = delegate
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.cellIdentifier = String(C.Type)
        
    }
    
    convenience init(tableView: UITableView, delegate: BaseTableControllerDelegate, bindWithModel: (tableViewCell: C, model: T) -> (), didSelectCell: (tableViewCell: C, model: T) -> (), cellIdentifier: String) {
        self.init(tableView: tableView, delegate: delegate, bindWithModel: bindWithModel, didSelectCell: didSelectCell)
        
        self.cellIdentifier = cellIdentifier
    }
    
    //
    
    @objc func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    @objc func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: C = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier!, forIndexPath: indexPath) as! C
        if let model: T = self.content[indexPath.row] {
            bindWithModel(tableViewCell:cell, model: model)
        }
        return cell
    }
    
    @objc func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let model: T = self.content[indexPath.row] {
            didSelectCell(tableViewCell: tableView.cellForRowAtIndexPath(indexPath) as! C, model: model)
        }
        
    }
    
    //
    
    func addModel(model: T) {
        content.append(model)
    }
    
    func addModels(models: [T]) {
        content+=models
    }
    
    func removeModel(model: T) {
        // Remove Model
    }
    
    func reloadData(){
        self.tableView?.reloadData()
    }
    
    
    
    
    
    
    
}

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

class BaseTableController<T: BaseModel, C: UITableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var content: [T] = []
    
    ///
    
    private var delegate: BaseTableControllerDelegate?
    private weak var tableView: UITableView?
    private var bindWithModel: (model: T) -> () = { model in
        
    }
    private var didSelectCell: (model: T) -> () = { model in

    }
    private var cellIdentifier: String?

    init(tableView: UITableView, delegate: BaseTableControllerDelegate, bindWithModel: (model: T) -> (), didSelectCell: (model: T) -> ()) {
        super.init()
        
        self.didSelectCell = didSelectCell
        self.bindWithModel = bindWithModel
        
        self.tableView = tableView
        self.delegate = delegate
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.cellIdentifier = String(C.Type)
    }
    
    convenience init(tableView: UITableView, delegate: BaseTableControllerDelegate, bindWithModel: (model: T) -> (), didSelectCell: (model: T) -> (), cellIdentifier: String) {
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
            bindWithModel(model: model)
        }
        return cell
    }
    
    @objc func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let model: T = self.content[indexPath.row] {
            didSelectCell(model: model)
        }
        
    }
    
}

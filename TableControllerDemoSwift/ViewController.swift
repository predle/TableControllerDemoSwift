//
//  ViewController.swift
//  TableControllerDemoSwift
//
//  Created by Beomseok Seo on 4/1/16.
//  Copyright © 2016 Predle. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BaseTableControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    var tableController: BaseTableController<BaseTableViewCell, BaseModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bindWithModel: (tableViewCell: BaseTableViewCell, model:BaseModel) -> () = { tableViewCell, model in
            // Bind View with Model
        }
        
        let didSelectCell: (tableViewCell: BaseTableViewCell, model: BaseModel) -> () = { tableViewCell, model in
            // Push To ViewController
        }
        
        tableController = BaseTableController(tableView: tableView, delegate: self, bindWithModel: bindWithModel, didSelectCell: didSelectCell)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


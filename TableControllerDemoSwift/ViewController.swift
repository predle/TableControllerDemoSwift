//
//  ViewController.swift
//  TableControllerDemoSwift
//
//  Created by Beomseok Seo on 4/1/16.
//  Copyright © 2016 Predle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableController: BaseTableController<BaseModel, BaseTableViewCell>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


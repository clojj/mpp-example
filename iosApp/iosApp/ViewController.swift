//
//  ViewController.swift
//  iosApp
//
//  Created by jetbrains on 12/04/2018.
//  Copyright © 2018 JetBrains. All rights reserved.
//

import UIKit
import greeting

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static let cellReuseIdentifier = "identifier"
    
    let product = Factory().create(config: ["user": "JetBrains"])

    let greeting = Greeting()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // First, we ask the table to 'dequeue' an unused cell that has our reuse identifier.
        // This isn't guaranteed to work. For instance, there might not be any cells created yet.
        var cell = tableView.dequeueReusableCell(withIdentifier: ViewController.cellReuseIdentifier)
        
        // Second, we check to see if we were able to dequeue a cell. If we weren't,
        // we create a new cell *using the same reuse identifier we used before.*
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: ViewController.cellReuseIdentifier)
        }
        
        // At this point, we definitely have a cell. Now, we can fill it with whatever
        // information we want to. In this case, we'll set the cell's text label to be
        // the index path for the cell, which is like an address: Section 0, Row 1, etc.
        
        // cell?.textLabel?.text = product.description
        let txt = greeting.greeting()
        cell?.textLabel?.text = txt

        return cell!
    }

    let tableView = UITableView.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.frame = self.view.bounds
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var label: UILabel!
}


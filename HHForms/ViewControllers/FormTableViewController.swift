//
//  FormTableViewController.swift
//  lendingcircles
//
//  Created by Hiba Hassan on 4/21/17.
//  Copyright © 2017 Lending Circles. All rights reserved.
//

import UIKit

class FormTableViewController: UITableViewController {
    var formDisplayModel: LCFormDisplayModel?
    
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
        self.title = NSLocalizedString("Edit Profile", comment: "")
        self.formDisplayModel = LCFormDisplayModel()
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(SingleTextFieldTableViewCell.self, forCellReuseIdentifier: FormRowType.singleTextFieldRowType.rawValue)
        self.tableView.register(DoubleTextFieldTableViewCell.self, forCellReuseIdentifier: FormRowType.doubleTextFieldRowType.rawValue)
        
        self.tableView.register(ProfileCustomTableViewCell.self, forCellReuseIdentifier: FormRowType.profileRowType.rawValue)
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension

        self.clearsSelectionOnViewWillAppear = false
        self.tableView.reloadData()

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return formDisplayModel?.sections.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return formDisplayModel?.sections[section].sectionItems.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionDescriptor = formDisplayModel?.sections[indexPath.section]
        let rowDescriptor = sectionDescriptor?.rowDescriptorFor(index: indexPath.row)
        let rowType = rowDescriptor?.rowType
        
        
        
        switch rowType! {
        case .profileRowType:
            let cell = tableView.dequeueReusableCell(withIdentifier: FormRowType.profileRowType.rawValue, for: indexPath) as! ProfileCustomTableViewCell
            cell.formRow = rowDescriptor?.formRow as? ProfileItemRow
            return cell
        case .singleTextFieldRowType:
            let cell = tableView.dequeueReusableCell(withIdentifier: FormRowType.singleTextFieldRowType.rawValue, for: indexPath) as! SingleTextFieldTableViewCell
            cell.formRow = rowDescriptor?.formRow as? SingleTextFieldTypeRow
            return cell
        case .doubleTextFieldRowType:
            let cell = tableView.dequeueReusableCell(withIdentifier: FormRowType.doubleTextFieldRowType.rawValue, for: indexPath) as! DoubleTextFieldTableViewCell
            cell.formRow = rowDescriptor?.formRow as? DoubleTextFieldTypeRow
            return cell
        }
 

        // Configure the cell...

        //return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return formDisplayModel?.sections[section].title
    }
    
    
    
}

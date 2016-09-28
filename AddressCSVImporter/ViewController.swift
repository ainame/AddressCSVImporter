//
//  ViewController.swift
//  AddressCSVImporter
//
//  Created by satoshi.namai on 2016/09/27.
//  Copyright © 2016年 生井 智司. All rights reserved.
//

import Cocoa
import RealmSwift
import RealmConverter

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let filePaths = [
            NSBundle.mainBundle().pathForResource("normalize", ofType: "csv")!
        ]
        let destinationRealmPath = "/Users/satoshi.namai/"

        // Analyze the files and produce a Realm-compatible schema
        let generator =  ImportSchemaGenerator(files: filePaths)
        let schema = try! generator.generate()

        // Use the schema and files to create the Realm file, and import the data
        let dataImporter = CSVDataImporter(files: filePaths)
        try! dataImporter.importToPath(destinationRealmPath, schema: schema)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}


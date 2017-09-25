//
//  ViewController.swift
//  PosClient
//
//  Created by 오민호 on 2017. 9. 26..
//  Copyright © 2017년 Minomi. All rights reserved.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController {
    
    let client = TCPClient(address: "127.0.0.1", port: 5001)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tappedTestButton(_ sender: UIButton) {
        
        switch client.connect(timeout: 1) {
        case .success:
            switch client.send(string: "test" ) {
            case .success:
                guard let data = client.read(1024*10) else { return }
                
                if let response = String(bytes: data, encoding: .utf8) {
                    print(response)
                }
                
            case .failure(let error):
                print(error)
            }
        case .failure(let error):
            print(error)
        }
        
    }
    
}


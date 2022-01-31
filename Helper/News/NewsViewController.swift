//
//  NewsViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import Foundation
import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        configure()
        bind()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",
                                                 for: indexPath)
        cell.textLabel?.text = "Cell \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    private func configure() {
        view.backgroundColor = .white
    }
    
    private func bind() {
        
    }
}

//
//  ProfileDataSource.swift
//  Helper
//
//  Created by Andrey on 10.05.2022.
//

import UIKit

class ProfileDataSource: NSObject {
  
    enum ProfileTableSection: Int, CaseIterable {
        case icon, other
    }
    
    var fields = [Field]()
}

extension ProfileDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        ProfileTableSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileTableSection(rawValue: section) else { return .zero }
        switch section {
        case .icon:
            return 1
        case .other:
            return fields.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = ProfileTableSection(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        switch section {
        case .icon:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileIconCell.reuseID(), for: indexPath
            ) as! ProfileIconCell
            
            cell.setUp(name: Constants.profileTitle)
            return cell
        case .other:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileOtherCell.reuseID(), for: indexPath
            ) as! ProfileOtherCell
            
            cell.setUp(fieldCell: fields[indexPath.row])
            return cell
        }
    }
}

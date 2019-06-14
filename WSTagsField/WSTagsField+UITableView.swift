//
//  WSTagsField+UITableView.swift
//  WSTagsField
//
//  Created by Damian Cesar on 6/13/19.
//  Copyright © 2019 Tia. All rights reserved.
//

import Foundation

// MARK: - UITableViewDataSource
extension WSTagsField: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeaheadData.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let data = typeaheadData[indexPath.row]

        cell.textLabel?.text = data.0
        cell.textLabel?.font = UIFont(name: "GTWalsheimRegular", size: 17)

        if indexPath.row.isMultiple(of: 2) {
            cell.backgroundColor = .interventionTableLightBlue
        } else {
            cell.backgroundColor = .backgroundLightGray
        }

        return cell
    }

}

// MARK: - UITableViewDelegate
extension WSTagsField: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = typeaheadData[indexPath.row]
        onTypeaheadDataSelected?(data)
        typeaheadData = []
    }

}

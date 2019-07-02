//
//  WSTagsField+UITableView.swift
//  Tia
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
        guard let data = typeaheadData[indexPath.row] as? TagFieldDisplayable else {
            fatalError("Cell must conform to protocol '\(String(describing: TagFieldDisplayable.self))'.")
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data.displayString
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
        let selectedData = typeaheadData[indexPath.row]

        guard let data = selectedData as? TagFieldDisplayable else {
            return
        }

        if shouldTagOnTypeaheadSelected {
            if let text = data.displayString {
                addTag(WSTag(text: text))
            }
        } else {
            textField.text = data.displayString
        }

        onTypeaheadDataSelected?(selectedData, shouldTagOnTypeaheadSelected)
        typeaheadData = []
    }

}

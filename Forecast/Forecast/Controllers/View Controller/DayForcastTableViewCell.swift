//
//  DayForcastTableViewCell.swift
//  Forecast
//
//  Created by Karl Pfister on 1/31/22.
//

import UIKit

class DayForcastTableViewCell: UITableViewCell {

    @IBOutlet weak var dayNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var forcastedHighLabel: UILabel!
    
    func updateViews(day: Day) {
        dayNameLabel.text = day.cityName
        forcastedHighLabel.text = "High: \(day.highTemp)"
        iconImageView.image = UIImage(named: day.iconString)
    }

} // End of class

/*
 dayNameLabel
 iconImageView
 forcastedHighLabel
 */

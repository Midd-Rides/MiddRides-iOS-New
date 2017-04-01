//
//  AppUtil.swift
//  MiddRides-iOS
//
//  Created by Tao Wang on 4/1/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

import UIKit

class AppUtil {
    
    class func displayAlertMessage(title: String?, msg: String?, action: UIAlertAction?, context: UIViewController) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        if let action = action {
            alert.addAction(action)
        }
        
        context.present(alert, animated: true, completion: nil)
    }
    
}

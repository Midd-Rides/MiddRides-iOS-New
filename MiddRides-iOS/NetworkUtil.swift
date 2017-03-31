//
//  NetworkUtil.swift
//  MiddRides-iOS
//
//  Created by Tao Wang on 3/31/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

import Alamofire

class NetworkUtil {
    // singleton
    static let sharedInstance = NetworkUtil()
    
    private init() {}
    
    public static func getInstance() -> NetworkUtil {
        return sharedInstance;
    }
    
    public func isServiceRunning() -> Bool {
        
        
        return false
    }
}

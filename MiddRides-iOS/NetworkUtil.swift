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
    
    /// Check if server is running
    /// @param callback     (DataResponse<Any>) -> Void
    public func isServiceRunning(callback: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request(Privacy.BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: callback)
    }
}

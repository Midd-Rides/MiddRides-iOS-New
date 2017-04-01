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
        Alamofire.request(Privacy.BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON {  response in
            if let status = response.response?.statusCode {
                switch (status) {
                case 200:
                    print("Success")
                    // TODO:
                default:
                    print("Failed")
                    // TODO:
                }
            }
        }
        
        return false
    }
}

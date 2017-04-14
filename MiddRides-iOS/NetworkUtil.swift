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
        Alamofire.request(Constants.INDEX_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON(completionHandler: callback)
    }
    
    /// Attemps to log in
    /// @param email        String
    /// @param password     String
    /// @param callback     (DataResponse<Any>) -> Void
    public func attemptLoggingIn(email: String, password: String,
                                callback: @escaping (DataResponse<Any>) -> Void) {
        let bodyParams = ["email": email,
                      "password": password]
        Alamofire.request(Constants.LOGIN_URL, method: .post, parameters: bodyParams, encoding: URLEncoding.httpBody, headers: nil).responseJSON(completionHandler: callback)
    }
}

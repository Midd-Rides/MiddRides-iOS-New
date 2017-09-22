//
//  RequestUtil.swift
//  MiddRides-iOS
//
//  Created by Tao Wang on 3/30/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

class Constants {
    
    // GET
    public static let INDEX_URL:String = Privacy.BASE_URL + "/"
    public static let SYNC_STOPS_URL:String = Privacy.BASE_URL + "/stops"
    
    // POST
    public static let LOGIN_URL:String = Privacy.BASE_URL + "/login"
    public static let REGISTER_URL:String = Privacy.BASE_URL + "/register"
    public static let SYNC_USER_URL:String = Privacy.BASE_URL + "/sync"
    public static let CHANGE_PASSWORD_URL:String = Privacy.BASE_URL + "/changepwd"
    public static let MAKE_REQUEST_URL:String = Privacy.BASE_URL + "/request"
    public static let SEND_EMAIL_URL:String = Privacy.BASE_URL + "/send"
    
    // DELETE
    public static let CANCEL_REQUEST_URL:String = Privacy.BASE_URL + "/cancel"
    
}


//
//  DataUtil.swift
//  MiddRides-iOS
//
//  Created by Tao Wang on 4/1/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

import Alamofire

class DataUtil {
    
    class func extractJsonFromResponse(_ dataResponse: DataResponse<Any>) -> [String: Any]? {
        guard let dict = dataResponse.result.value as? [String: Any] else {
            print("Failed to extract data from response")
            return nil
        }
        
        return dict
    }
    
}

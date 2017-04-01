//
//  Privacy
//  MiddRides-iOS
//
//  Created by Tao Wang on 3/31/17.
//  Copyright © 2017 Middle Endian. All rights reserved.
//

import UIKit

class Privacy {
    
    public static let BASE_URL = "http://ec2-54-174-221-62.compute-1.amazonaws.com:3000"
    
    // compatible with Java (Android) version
    public static func encodePassword(passwordToEncode: String) -> String {
        return Data(passwordToEncode.utf8).base64EncodedString()
    }
    
}

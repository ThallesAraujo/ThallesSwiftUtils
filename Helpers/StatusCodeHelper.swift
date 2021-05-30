//
//  Created by Thalles Araújo on 18/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import Alamofire
class StatusCodeHelper{
    
    public static func handleResponse(response: DataResponse<Any>, success: @escaping () -> Void, error: (String) -> Void){
        guard let statusCode = response.response?.statusCode else{
            error("Fail to retrieve data")
            return
        }
        if statusCode == 200{
            success()
        }else{
            if statusCode == 404{
                error("Not found")
            }else if statusCode > 399 && statusCode < 500{
                error("Invalid session")
            }else if statusCode == 500{
                error("Server error")
            }else{
                error("Error \(statusCode)")
            }
        }
    }
    
}

//
//  MockData.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 4/4/22.
//

import CloudKit

struct MockData {
    static var location: CKRecord {
        let record = CKRecord(recordType: "DDGLocation")
        record[DDGLocation.kName] = "Sean's Bar and Grill"
        record[DDGLocation.kAddress] = "123 Main Street"
        record[DDGLocation.kDescription] = "Some description that is long enough to be more than one line. Hope this looks good!"
        record[DDGLocation.kWebsiteURL] = "https://seanallen.co"
        record[DDGLocation.kLocation] = CLLocation(latitude: 37.408480, longitude: -121.891430)
        
        record[DDGLocation.kphoneNumber] = "123-456-7890"
        
        return record
    }
}

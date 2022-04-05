//
//  DDGLocation.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 3/20/22.
//

import CloudKit

struct DDGLocation {
    static let kName = "name"
    static let kDescription = "description"
    static let kSquareAsset = "squareAsset"
    static let kBannerAsset = "bannerAsset"
    static let kAddress = "address"
    static let kLocation = "location"
    static let kphoneNumber = "phoneNumber"
    static let kWebsiteURL = "websiteURL"
    
    let ckRecordID: CKRecord.ID
    let name: String?
    let description: String?
    let squareAsset: CKAsset?
    let bannerAsset: CKAsset?
    let address: String?
    let location: CLLocation?
    let phoneNumber: String?
    let websiteURL: String?
    
    init(record: CKRecord) {
        ckRecordID = record.recordID
        name = record[DDGLocation.kName] as? String
        description = record[DDGLocation.kDescription] as? String
        squareAsset = record[DDGLocation.kSquareAsset] as? CKAsset
        bannerAsset = record[DDGLocation.kBannerAsset] as? CKAsset
        address = record[DDGLocation.kAddress] as? String
        location = record[DDGLocation.kLocation] as? CLLocation ?? CLLocation(latitude: 0, longitude: 0)
        phoneNumber = record[DDGLocation.kphoneNumber] as? String
        websiteURL = record[DDGLocation.kWebsiteURL] as? String
        
    }
}

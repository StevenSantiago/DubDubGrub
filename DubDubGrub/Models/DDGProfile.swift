//
//  DDGProfile.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 4/4/22.
//

import CloudKit

struct DDGProfile {
    static let kFirstName = "firstName"
    static let kLastName = "lastName"
    static let kAvatar = "avatar"
    static let kCompanyName = "companyName"
    static let kBio = "bio"
    static let kIsCheckedIn = "isCheckedIn"
    
    let ckRecordID: CKRecord.ID
    let firstName: String?
    let lastName: String?
    let avatar: CKAsset?
    let companyName: String?
    let bio: String?
    let isCheckedIn: CKRecord.Reference? = nil

    
    init(record: CKRecord) {
        ckRecordID = record.recordID
        firstName = record[DDGProfile.kFirstName] as? String
        lastName = record[DDGProfile.kLastName] as? String
        avatar = record[DDGProfile.kAvatar] as? CKAsset
        companyName = record[DDGProfile.kCompanyName] as? String
        bio = record[DDGProfile.kBio] as? String
    }
}

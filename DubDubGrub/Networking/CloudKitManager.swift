//
//  CloudKitManager.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 4/4/22.
//

import Combine
import CloudKit

struct CloudKitManager {
    
    static func getLocations() -> AnyPublisher<[DDGLocation], Error> {
        let alphabeticalSort = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        let query = CKQuery(recordType: RecordType.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [alphabeticalSort]

        return Future<[DDGLocation], Error> { promise in
            CKContainer.default().publicCloudDatabase.fetch(withQuery: query) { result in
                switch result {
                case .success((let matchResults, _)):
                    var records = [CKRecord]()
                    for (_,recordResult) in matchResults {
                        switch recordResult {
                        case .success(let record):
                            records.append(record)
                            
                        case .failure(let error):
                            //Returning error if one record has an error??
                            return promise(.failure(error))
                        }
                    }
                    return promise(.success(records.map(\.asDDGLocation)))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
}

extension CKRecord {

    var asDDGLocation: DDGLocation {
        DDGLocation(record: self)
    }
    
    var asDDGProfile: DDGProfile {
        DDGProfile(record: self)
    }
}

//
//  Network.swift
//  News
//
//  Created by Josicleison on 10/10/22.
//

import Foundation

struct Network {
        
    static func call(from url: String?, withKey: Bool = true) async -> Data? {

        guard var url = url else {print("ERROR: Wrong url"); return nil}
        if withKey {url += "f1a110d5"}
        guard let url = URL(string: url) else {print("ERROR: Wrong url"); return nil}

        do {

            let (data, response) = try await URLSession.shared.data(from: url)
            print("RESPONSE:", response)

            return data
        }
        catch {print("ERROR: \(error)"); return nil}
    }

    static func decode<T: Codable>(_ what: T.Type, from data: Data) -> T? {

        do {

            return try JSONDecoder().decode(what.self, from: data)
        }
        catch {print("ERROR: \(error)"); return nil}
    }
}

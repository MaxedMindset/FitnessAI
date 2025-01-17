import Foundation

struct UserDefaultsHelper {
    static func save<T: Codable>(object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }

    static func load<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let data = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            return try? decoder.decode(type, from: data)
        }
        return nil
    }
}

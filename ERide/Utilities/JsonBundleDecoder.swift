import Foundation

class JSONDecoderHelper {
    static func decode<T: Decodable>(fileName: String, fileExtension: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(T.self, from: data)
                return decodedData
            } catch {
                print("Error decoding JSON: \(error)")
                return nil
            }
        } else {
            print("JSON file not found")
            return nil
        }
    }
}

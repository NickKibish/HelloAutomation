import Foundation

public struct Helper {
    public init() {}
    
    public func now(_ date: Date = Date()) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }

    public func today(_ date: Date = Date()) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

    public func ping() async -> String {
        try? await Task.sleep(nanoseconds: 1_500_000_000)
        return "pong"
    }
}

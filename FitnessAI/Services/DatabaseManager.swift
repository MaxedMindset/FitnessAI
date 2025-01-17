import Foundation
import SQLite3

class DatabaseManager {
    static let shared = DatabaseManager()
    private var db: OpaquePointer?

    private init() {
        openDatabase()
        createTable()
    }

    private func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("FitnessAI.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
        }
    }

    private func createTable() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS UserPlans (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            content TEXT
        );
        """
        if sqlite3_exec(db, createTableQuery, nil, nil, nil) != SQLITE_OK {
            print("Error creating table")
        }
    }

    func insertPlan(type: String, content: String) {
        let insertQuery = "INSERT INTO UserPlans (type, content) VALUES (?, ?);"
        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, type, -1, nil)
            sqlite3_bind_text(statement, 2, content, -1, nil)

            if sqlite3_step(statement) == SQLITE_DONE {
                print("Successfully inserted plan")
            } else {
                print("Could not insert plan")
            }
        } else {
            print("Insert statement could not be prepared")
        }
        sqlite3_finalize(statement)
    }

    func fetchPlans() -> [(id: Int, type: String, content: String)] {
        let fetchQuery = "SELECT * FROM UserPlans;"
        var statement: OpaquePointer?

        var plans: [(id: Int, type: String, content: String)] = []

        if sqlite3_prepare_v2(db, fetchQuery, -1, &statement, nil) == SQLITE_OK {
            while sqlite3_step(statement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(statement, 0))
                let type = String(cString: sqlite3_column_text(statement, 1))
                let content = String(cString: sqlite3_column_text(statement, 2))
                plans.append((id, type, content))
            }
        } else {
            print("Fetch statement could not be prepared")
        }
        sqlite3_finalize(statement)
        return plans
    }
}

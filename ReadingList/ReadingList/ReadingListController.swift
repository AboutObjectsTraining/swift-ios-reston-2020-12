// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import UIKit

class ReadingListController: UITableViewController {
    @IBOutlet var storeController: ReadingListStore!
    lazy var readingList = storeController.fetch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
            case "View":
                guard let indexPath = tableView.indexPathForSelectedRow,
                      let controller = segue.destination as? ViewBookController else { return }
        
                controller.book = readingList.book(at: indexPath)
            case "Add":
                guard let navController = segue.destination as? UINavigationController,
                      let controller = navController.children.first as? AddBookController else { return }
                
                controller.done = { [weak self] book in self?.insert(book: book) }
            default: break
        }
    }
    
    private func insert(book: Book) {
        let indexPath = IndexPath(row: 0, section: 0)
        readingList.insert(book: book, at: indexPath)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}

// MARK: - Unwind segues
extension ReadingListController {
    
    @IBAction func done(unwindSegue: UIStoryboardSegue) {
        tableView.reloadData()
        storeController.save(readingList: readingList)
    }
    
    @IBAction func cancel(unwindSegue: UIStoryboardSegue) {
        
    }
}

// MARK: - UITableViewDataSource methods
extension ReadingListController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Book Cell") else {
            fatalError("Unable to obtain cell. Check the reuse identifier in the storyboard.")
        }
        
        let book = readingList.book(at: indexPath)
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? "----"), \(book.author?.fullName ?? "Unknown")"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        readingList.removeBook(at: indexPath)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        storeController.save(readingList: readingList)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        readingList.moveBook(at: sourceIndexPath, to: destinationIndexPath)
        
        storeController.save(readingList: readingList)
    }
}


// MARK: - UITableViewDataSource experiments
//extension ReadingListController {
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell: UITableViewCell
//
//        if let cachedCell = tableView.dequeueReusableCell(withIdentifier: "My Cool Cell") {
//            cell = cachedCell
//        } else {
//            cell = UITableViewCell(style: .default, reuseIdentifier: "My Cool Cell")
//        }
//
//        cell.textLabel?.text = "Row \(indexPath.row + 1)"
//        return cell
//    }
//}

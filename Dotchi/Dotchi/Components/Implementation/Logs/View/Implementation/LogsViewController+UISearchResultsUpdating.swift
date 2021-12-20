import UIKit

extension LogsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        eventHandler.didEnterSearch(text: text)
    }
}

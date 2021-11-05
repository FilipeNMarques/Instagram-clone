import UIKit

private let identifier: String = "FeedController"

class FeedController: UICollectionViewController {
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()

        
    }
    
//    MARK: - Helpers
    func configureUI() {
        collectionView.backgroundColor = .white
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        cell.backgroundColor = .systemOrange
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 200)
    }
}

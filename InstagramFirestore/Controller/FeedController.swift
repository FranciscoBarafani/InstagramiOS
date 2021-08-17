//
//  FeedController.swift
//  InstagramFirestore
//
//  Created by Francisco Barafani on 19/07/2021.
//

import UIKit
import Firebase

private let reuseIdentifier = "Cell"

class FeedController: UICollectionViewController {
    
    // MARK: -Lifecycle
    private var posts = [Post]()
    
    var post: Post?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        configureUI()
        fetchPosts()
    }
    
    //MARK: -Actions
    
    @objc func handleRefresh(){
        posts.removeAll()
        fetchPosts()
    }
    
    @objc func handleLogout(){
        do {
            try Auth.auth().signOut()
            //After the user logs out we instanciate a the LoginController and show it as
            //a Full screen modal
            let controller = LoginController()
            controller.delegate = self.tabBarController as? MainTabController
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        } catch {
            print("DEBUG: Error to log out")
        }
    }
    
    // MARK: -API
    
    func fetchPosts() {
        if post == nil {
            PostService.fetchPosts { posts in
                self.posts = posts
                self.collectionView.refreshControl?.endRefreshing()
                self.collectionView.reloadData()
            }
        }
    }
    
    //MARK: -Helpers
    
    func configureUI(){
        collectionView.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        if post == nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        }
        
        navigationItem.title = "Feed"
        
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refresher
    }
    
}

// MARK: -CollectionViewDatasource

extension FeedController {
    //How many cells to render
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post != nil ? 1 : posts.count
    }
    
    //Cell configuration, reusable cells uses cells when they are not being seen anyomre
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedCell
        if let post = post {
            cell.viewModel = PostViewModel(post: post)
        } else if posts.count > 0{
            cell.viewModel = PostViewModel(post: posts[indexPath.row])
        }
        return cell
    }
}

// MARK: -UICollectionViewDelegateFlowLayout

//Sets Cells size
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        var height = width + 8 + 40 + 8
        height += 50
        height += 60
        return CGSize(width: width, height: height)
    }
}

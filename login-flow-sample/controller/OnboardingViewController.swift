//
//  OnboardingViewController.swift
//  login-flow-sample
//
//  Created by Michael Benefiel on 4/22/22.
//

import Foundation
import UIKit

protocol OnboardingDelegate: AnyObject {
    
    func showMainTabBarController()
    
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupPageControl()
        setupCollectionView()
        showCaption(atIndex: 0)
    }
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupPageControl(){
        pageControl.numberOfPages = Slide.collection.count
    }
    
    private func setupViews(){
        view.backgroundColor = .systemGroupedBackground
        
    }
    
    @IBAction func getStartedButtonTapped(_sender: UIButton){
        // print("get started button tapped")
        performSegue(withIdentifier: K.Segue.showLoginSignUpScreen, sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segue.showLoginSignUpScreen {
            if let destination = segue.destination as? LoginViewController {
                destination.delegate = self
            }
        }
    }
    
    
    private func showCaption(atIndex index: Int){
        let slide = Slide.collection[index]
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
        
    }
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Slide.collection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "containerCell", for: indexPath) as? OnboardingCollectionViewCell else { return UICollectionViewCell()}
        // cell.backgroundColor = indexPath.row % 2 == 0 ? .blue : .red
        let imageName = Slide.collection[indexPath.item].imageName
        let image = UIImage(named: imageName) ?? UIImage()
        cell.configure(image: image)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        showCaption(atIndex: index)
        self.pageControl.currentPage = index
    }
}

extension OnboardingViewController: OnboardingDelegate {
    func showMainTabBarController() {
        //dismiss loginviewcontroller
        //show maintab bar
        if let loginViewController = self.presentedViewController as? LoginViewController {
            loginViewController.dismiss(animated: true) {
                PresenterManager.shared.show(vc: .mainTabBarController)
            }
        }
        
        
    }
}


//
//  SwappingViewController.swift
//  PageController
//
//  Created by Mujahid Ali on 23/01/22.
//


import UIKit
public class SwappingViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    public var page = PageArray()
    
    let prevButton: UIButton = {
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    lazy var pageControll: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = page.pages?.count ?? 0
        pc.currentPage = 0
        pc.currentPageIndicatorTintColor = .magenta
        pc.pageIndicatorTintColor = .gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    var controllStackView: UIStackView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true
        setBottomControl()
        collectionView?.register(PageCollectionCell.self, forCellWithReuseIdentifier: "pageCollectionCell")
    }
    public init(layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBottomControl() {
        // Bottom control stack view
        controllStackView = UIStackView(arrangedSubviews: [prevButton, pageControll, nextButton])
        controllStackView.distribution = .fill
        controllStackView.spacing = 0
        controllStackView.axis = .horizontal
        controllStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(controllStackView)
        prevButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        controllStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        controllStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        controllStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        controllStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleNext() {
        let nextIndex = min(pageControll.currentPage + 1, page.pages?.count ?? 0)
        guard nextIndex < page.pages?.count ?? 0 else {return}
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControll.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc func handlePrev() {
        let prevIndex = max(pageControll.currentPage - 1, 0)
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControll.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

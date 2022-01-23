//
//  SwappingViewController + Extension.swift
//  PageController
//
//  Created by Mujahid Ali on 23/01/22.
//

import UIKit

extension SwappingViewController {
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate { _ in
            self.collectionViewLayout.invalidateLayout()
            if self.pageControll.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let index = self.pageControll.currentPage
                let indexPath = IndexPath(item: index, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        } completion: { _ in
            //
        }

    }
}

//
//  Coordinator.swift
//  QRCodeScanner
//
//  Created by Petre Vane on 22/10/2020.
//

import UIKit


class MainCoordinator: NSObject, Coordinator {
    
    var window: UIWindow?
    var childControllers: [UIViewController]
    var navigationController: UINavigationController?
    
    
    init(window: UIWindow) {
        self.window = window
        self.childControllers = []
        super.init()
        self.window?.rootViewController = startFlow()
    }
    
    func startFlow() -> UINavigationController {
        self.navigationController = presentStartingScreen()
        childControllers.append(navigationController!)
        startScanningScreen()
        return navigationController!
    }
    
    func presentStartingScreen() -> UINavigationController {
        let startingVC = StartingViewController.instantiate(delegate: self)
        navigationController = UINavigationController(rootViewController: startingVC)
        return navigationController!
    }
    
    func startScanningScreen() {
        let scanningScreen = ScanningScreenViewController.instantiate(delegate: self)
        childControllers.append(scanningScreen)
    }
    
    func presentScanningScreen() {
        if childControllers.count > 1 { navigationController?.present(childControllers.last!, animated: true, completion: nil); return }
        else { startScanningScreen() }
        navigationController?.present(childControllers.last!, animated: true, completion: nil)
    }
    
    func dismissScanningScreen() {
        navigationController?.dismiss(animated: true, completion: nil)
        childControllers.removeLast()
    }
    
}

extension MainCoordinator: StartingViewControllerDelegate {
    func didPressScanButton() {
        presentScanningScreen()
    }
}

extension MainCoordinator: ScanningScreenDelegate {
    func didPressBackButton(onViewController: UIViewController) {
        dismissScanningScreen()
    }
}

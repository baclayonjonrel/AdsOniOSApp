//
//  ViewController.swift
//  AdsOniOSApp
//
//  Created by Jonrel Baclayon on 7/27/24.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADFullScreenContentDelegate {

    private var interstitial: GADInterstitialAd?
    private var videoAd: GADInterstitialAd?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInterstitialAd()
        loadVideoAd()
    }

    private func loadInterstitialAd() {
        let interstitialAdUnitID = "ca-app-pub-3940256099942544/4411468910"
        
        GADInterstitialAd.load(
            withAdUnitID: interstitialAdUnitID,
            request: GADRequest()
        ) { ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            self.interstitial = ad
            self.interstitial?.fullScreenContentDelegate = self
        }
    }

    private func loadVideoAd() {
        let videoAdUnitID = "ca-app-pub-3940256099942544/1712485313"
        
        GADInterstitialAd.load(
            withAdUnitID: videoAdUnitID,
            request: GADRequest()
        ) { ad, error in
            if let error = error {
                print("Failed to load video ad with error: \(error.localizedDescription)")
                return
            }
            self.videoAd = ad
            self.videoAd?.fullScreenContentDelegate = self
        }
    }

    @IBAction func showAdButtonClick(_ sender: Any) {
        if let interstitial = interstitial {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Interstitial ad wasn't ready")
            loadInterstitialAd()
        }
    }

    @IBAction func playVideoAdClick(_ sender: Any) {
        if let videoAd = videoAd {
            videoAd.present(fromRootViewController: self)
        } else {
            print("Video ad wasn't ready")
            loadVideoAd()
        }
    }
    
    // MARK: - GADFullScreenContentDelegate

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Failed to present ad with error: \(error.localizedDescription)")
        if ad === interstitial {
            loadInterstitialAd()
        } else if ad === videoAd {
            loadVideoAd()
        }
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad was dismissed")
        if ad === interstitial {
            loadInterstitialAd()
        } else if ad === videoAd {
            loadVideoAd()
        }
    }
}


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
    private var rewardedAd: GADRewardedAd?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Load both interstitial and rewarded video ads
        loadInterstitialAd()
        loadRewardedAd()
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

    private func loadRewardedAd() {
        let rewardedAdUnitID = "ca-app-pub-3940256099942544/1712485313"
        
        GADRewardedAd.load(
            withAdUnitID: rewardedAdUnitID,
            request: GADRequest()
        ) { ad, error in
            if let error = error {
                print("Failed to load rewarded ad with error: \(error.localizedDescription)")
                return
            }
            self.rewardedAd = ad
            self.rewardedAd?.fullScreenContentDelegate = self
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
        if let rewardedAd = rewardedAd {
            rewardedAd.present(fromRootViewController: self) {
                self.showRewardAlert()
            }
        } else {
            print("Rewarded ad wasn't ready")
            loadRewardedAd()
        }
    }

    private func showRewardAlert() {
        let alert = UIAlertController(
            title: "Congratulations!",
            message: "You've earned your reward!",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // MARK: - GADFullScreenContentDelegate

    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Failed to present ad with error: \(error.localizedDescription)")
        if ad === interstitial {
            loadInterstitialAd()
        } else if ad === rewardedAd {
            loadRewardedAd()
        }
    }

    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad was dismissed")
        if ad === interstitial {
            loadInterstitialAd()
        } else if ad === rewardedAd {
            loadRewardedAd()
            showRewardAlert()
        }
    }

}

//
//  ViewController.swift
//  SpringApp
//
//  Created by Алексей Филиппов on 03.05.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var titleLabelAnimation: SpringLabel!
    @IBOutlet var presetLabel: SpringLabel!
    @IBOutlet var curveLabel: SpringLabel!
    @IBOutlet var forceLabel: SpringLabel!
    @IBOutlet var delayLabel: SpringLabel!
    @IBOutlet var durationLabel: SpringLabel!
    
    @IBOutlet var viewAnimation: SpringView!
    @IBOutlet var runButton: SpringButton!
    
    private let animations: [AnimationPreset] = [
        .pop,
        .slideUp,
        .fadeIn,
        .fall,
        .flash,
        .morph,
        .shake,
        .swing,
        .wobble,
        .squeeze,
        .zoomIn
    ]
    private let curves: [AnimationCurve] = [
        .easeIn,
        .easeInCirc,
        .easeInExpo,
        .easeInBack,
        .easeInCubic,
        .easeInQuad,
        .easeInQuart,
        .easeInSine,
        .linear,
        .spring
    ]
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAnimation.layer.cornerRadius = 12
        runButton.layer.cornerRadius = 12
        presetLabel.text = "Preset: \(viewAnimation.animation)"
        curveLabel.text = "Curve: \(viewAnimation.curve)"
        forceLabel.text = "Force: \(String(format: "%.2f", viewAnimation.force))"
        delayLabel.text = "Delay: \(String(format: "%.2f", viewAnimation.delay))"
        durationLabel.text = "Duration: \(String(format: "%.2f", viewAnimation.duration))"
    }

    //MARK: - IBActions
    @IBAction func runButtonTapped(_ sender: SpringButton) {
        let randomAnimationIndex = Int.random(in: 0..<animations.count)
        let randomAnimation = animations[randomAnimationIndex]
        viewAnimation.animation = randomAnimation.rawValue
        
        let randomCurveIndex = Int.random(in: 0..<curves.count)
        let randomCurve = curves[randomCurveIndex]
        viewAnimation.curve = randomCurve.rawValue
        
        viewAnimation.force = CGFloat.random(in: 0.5...2)
        viewAnimation.delay = CGFloat.random(in: 0.5...2)
        viewAnimation.duration = CGFloat.random(in: 0.5...2)
        viewAnimation.animate()
        
        presetLabel.text = "Preset: \(viewAnimation.animation)"
        curveLabel.text = "Curve: \(viewAnimation.curve)"
        forceLabel.text = "Force: \(String(format: "%.2f", viewAnimation.force))"
        delayLabel.text = "Delay: \(String(format: "%.2f", viewAnimation.delay))"
        durationLabel.text = "Duration: \(String(format: "%.2f", viewAnimation.duration))"
        
        let nextAnimationIndex = (randomAnimationIndex + 1) % animations.count
        let nextAnimation = animations[nextAnimationIndex]
        runButton.setTitle("Next animation: \(nextAnimation.rawValue)", for: .normal)
    }
    
}


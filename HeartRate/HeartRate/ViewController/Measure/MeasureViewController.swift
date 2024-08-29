//
//  MeasureViewController.swift
//  HeartRate
//
//  Created by Phạm Hoàng on 27/8/24.
//

import UIKit
import AVFoundation

class MeasureViewController: UIViewController {
    @IBOutlet weak var tabbarView: TabBarViewController!
    @IBOutlet weak var circular: Circular!
    @IBOutlet weak var previewLayerView: UIView!
    @IBOutlet weak var bpmLabel: UILabel!
    
    private var validFrameCounter = 0
    private var heartRateManager: HeartRateManager!
    private var hueFilter = Filter()
    private var pulseDetector = PulseDetector()
    private var inputs: [CGFloat] = []
    private var measurementStartedFlag = false
    private var timer = Timer()
    var i : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "Measure"
        tabbarView.registerDelegate(delegate: self)
        circular.setProgressColor = UIColor(displayP3Red: 50.0/255.0, green: 168.0/255.0, blue: 82.0/255.0, alpha: 1.0)
        circular.setTrackColor = UIColor(displayP3Red: 205.0/255.0, green: 247.0/255.0, blue: 212.0/255.0, alpha: 1.0)
        initVideoCapture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initCaptureSession()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        deinitCaptureSession()
        timer.invalidate()
    }
    
    private func initVideoCapture() {
        let specs = VideoSpec(fps: 30, size: CGSize(width: 150, height: 150))
        heartRateManager = HeartRateManager(cameraType: .back, preferredSpec: specs, previewContainer: previewLayerView.layer)
        heartRateManager.imageBufferHandler = { [unowned self] (imageBuffer) in
            self.handle(buffer: imageBuffer)
        }
    }
    
    private func initCaptureSession() {
        heartRateManager.startCapture()
    }
    
    private func deinitCaptureSession() {
        heartRateManager.stopCapture()
        toggleTorch(status: false)
    }
    
    private func toggleTorch(status: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        device.toggleTorch(on: status)
    }
    
    private func startMeasurement() {
        DispatchQueue.main.async {
            self.toggleTorch(status: true)
            self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] (timer) in
                guard let self = self else { return }
                let average = self.pulseDetector.getAverage()
                let pulse = 60.0/average
                if pulse == -60 {
                    print("xxxxxxx finished")
                } else {
                    if lroundf(pulse) > 0 {
                        if i <= 1 {
                            self.bpmLabel.text = "\(lroundf(pulse))"
                            i += 0.05
                            print("xxxxxxxx \(i) \(lroundf(pulse))")
                            circular.setProgressWithAnimation(duration: 0.5, value: Float(i))
                        } else {
                            timer.invalidate()
                        }
                    }
                    print("\(lroundf(pulse)) BPM")
                }
            })
        }
    }
}

extension MeasureViewController {
    fileprivate func handle(buffer: CMSampleBuffer) {
        var redmean:CGFloat = 0.0;
        var greenmean:CGFloat = 0.0;
        var bluemean:CGFloat = 0.0;
        
        let pixelBuffer = CMSampleBufferGetImageBuffer(buffer)
        let cameraImage = CIImage(cvPixelBuffer: pixelBuffer!)
        
        let extent = cameraImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        let averageFilter = CIFilter(name: "CIAreaAverage",
                                     parameters: [kCIInputImageKey: cameraImage, kCIInputExtentKey: inputExtent])!
        let outputImage = averageFilter.outputImage!
        
        let ctx = CIContext(options:nil)
        let cgImage = ctx.createCGImage(outputImage, from:outputImage.extent)!
        
        let rawData:NSData = cgImage.dataProvider!.data!
        let pixels = rawData.bytes.assumingMemoryBound(to: UInt8.self)
        let bytes = UnsafeBufferPointer<UInt8>(start:pixels, count:rawData.length)
        var BGRA_index = 0
        for pixel in UnsafeBufferPointer(start: bytes.baseAddress, count: bytes.count) {
            switch BGRA_index {
            case 0:
                bluemean = CGFloat (pixel)
            case 1:
                greenmean = CGFloat (pixel)
            case 2:
                redmean = CGFloat (pixel)
            case 3:
                break
            default:
                break
            }
            BGRA_index += 1
        }
        
        let hsv = rgb2hsv((red: redmean, green: greenmean, blue: bluemean, alpha: 1.0))
        if (hsv.1 > 0.5 && hsv.2 > 0.5) {
            DispatchQueue.main.async {
                print("Hold your index finger ☝️ still.")
                self.toggleTorch(status: true)
                if !self.measurementStartedFlag {
                    self.startMeasurement()
                    self.measurementStartedFlag = true
                }
            }
            validFrameCounter += 1
            inputs.append(hsv.0)
            
            let filtered = hueFilter.processValue(value: Double(hsv.0))
            if validFrameCounter > 60 {
                self.pulseDetector.addNewValue(newVal: filtered, atTime: CACurrentMediaTime())
            }
        } else {
            validFrameCounter = 0
            measurementStartedFlag = false
            pulseDetector.reset()
            DispatchQueue.main.async {
                print("Cover the back camera until the image turns red 🟥")
            }
        }
    }
}

extension MeasureViewController: TabbarProtocol {
    func navigateHome() {
        let vc = HomeViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func navigateMeasure() {
        
    }
    
    func navigateTracking() {
        let vc = TrackingViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

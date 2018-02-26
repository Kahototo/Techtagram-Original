//
//  ViewController.swift
//  TechtaGram
//
//  Created by 小西夏穂 on 2017/10/12.
//  Copyright © 2017年 小西夏穂. All rights reserved.
//

import UIKit

//写真をSNSに投稿したい時に必要なフレームワーク
import Accounts

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //撮った画像の表示
    @IBOutlet var cameraImageView: UIImageView!
    
    @objc var Stamp1: UIButton!
    @objc var Stamp2: UIButton!
    @objc var Stamp3: UIButton!
    @objc var Stamp4: UIButton!
    @objc var Stamp5: UIButton!
    @objc var Stamp6: UIButton!
    @objc var Stamp7: UIButton!
    @objc var Stamp8: UIButton!
    
//    // 合成画像の宣言
//    var gousei = UIImage(named: "image.png")

    //スタンプ画像の名前が入った配列
    var imageNameArray: [String] = ["face1.png", "face2.png", "face3.png", "face4.png","color1.png", "color2.png", "color3.png", "color4.png"]
    
    //選択しているスタンプ画像の番号
    var imageIndex: Int = 0
    
    //スタンプ画像が入るImageView
    var stampImageView: UIImageView!
    
    //画像を加工するための元となる画像
    var originalImage: UIImage!
    
    //画像を加工するフィルターの宣言
    var filter: CIFilter!
    
    // UIImage のインスタンスを設定
    let image1:UIImage = UIImage(named:"face1.png")!
    let image2:UIImage = UIImage(named:"face2.png")!
    let image3:UIImage = UIImage(named:"face3.png")!
    let image4:UIImage = UIImage(named:"face4.png")!
    let image5:UIImage = UIImage(named:"color1.png")!
    let image6:UIImage = UIImage(named:"color2.png")!
    let image7:UIImage = UIImage(named:"color3.png")!
    let image8:UIImage = UIImage(named:"color4.png")!
    
    // UIButton のインスタンスを生成
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    

    
    
    @IBAction func pushStamp1(sender:UIButton) {
        imageIndex = 1
    }
    @IBAction func pushStamp2(sender:UIButton) {
        imageIndex = 2
    }
    @IBAction func pushStamp3(sender:UIButton) {
        imageIndex = 3
    }
    @IBAction func pushStamp4(sender:UIButton) {
        imageIndex = 4
    }
    @IBAction func pushStamp5(sender:UIButton) {
        imageIndex = 5
    }
    @IBAction func pushStamp6(sender:UIButton) {
        imageIndex = 6
    }
    @IBAction func pushStamp7(sender:UIButton) {
        imageIndex = 7
    }
    @IBAction func pushStamp8(sender:UIButton) {
        imageIndex = 8
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // ボタンの設置座標とサイズを設定する.
        button1.frame = CGRect(x: 25, y: 6, width: 50, height: 50)
        button2.frame = CGRect(x: 94, y: 6, width: 50, height: 50)
        button3.frame = CGRect(x: 165, y: 6, width: 50, height: 50)
        button4.frame = CGRect(x: 235, y: 6, width: 50, height: 50)
        button5.frame = CGRect(x: 306, y: 6, width: 50, height: 50)
        button6.frame = CGRect(x: 375, y: 6, width: 50, height: 50)
        button7.frame = CGRect(x: 442, y: 6, width: 50, height: 50)
        button8.frame = CGRect(x: 515, y: 6, width: 50, height: 50)
        
        
        // button1 (buttonの画像・背景色・イベントを追加)
        button1.setImage(image1, for: .normal)
        button1.backgroundColor = UIColor.clear
        button1.addTarget(self, action: #selector(pushStamp1(sender: )), for: .touchUpInside)
        
        // button2
        button2.setImage(image2, for: .normal)
        button2.backgroundColor = UIColor.clear
        button2.addTarget(self, action: #selector(pushStamp2(sender: )), for: .touchUpInside)
        
        // button3
        button3.setImage(image3, for: .normal)
        button3.backgroundColor = UIColor.clear
        button3.addTarget(self, action: #selector(pushStamp3(sender: )), for: .touchUpInside)
        
        // button4
        button4.setImage(image4, for: .normal)
        button4.backgroundColor = UIColor.clear
        button4.addTarget(self, action: #selector(pushStamp4(sender: )), for: .touchUpInside)
        
        // button5
        button5.setImage(image5, for: .normal)
        button5.backgroundColor = UIColor.clear
        button5.addTarget(self, action: #selector(pushStamp5(sender: )), for: .touchUpInside)
        
        // button6
        button6.setImage(image6, for: .normal)
        button6.backgroundColor = UIColor.clear
        button6.addTarget(self, action: #selector(pushStamp6(sender: )), for: .touchUpInside)
        
        // button7
        button7.setImage(image7, for: .normal)
        button7.backgroundColor = UIColor.clear
        button7.addTarget(self, action: #selector(pushStamp7(sender: )), for: .touchUpInside)
        
        // button8
        button8.setImage(image8, for: .normal)
        button8.backgroundColor = UIColor.clear
        button8.addTarget(self, action: #selector(pushStamp8(sender: )), for: .touchUpInside)
        
        
        //スクロールビューについて//
        
        //UIScrollViewのインスタンス作成
        var scrollView = UIScrollView()
        //scrollViewの大きさを設定。
        scrollView = UIScrollView(frame: CGRect(x:0, y:600, width: 375, height: 100))
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:self.view.frame.width * 4, height:100)
        //スクロールビューの色
        scrollView.backgroundColor = UIColor.lightGray
        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
        //buttonをスクロールビューに追加//
        
        // 実際にviewに表示する
        scrollView.addSubview(button1)
        scrollView.addSubview(button2)
        scrollView.addSubview(button3)
        scrollView.addSubview(button4)
        scrollView.addSubview(button5)
        scrollView.addSubview(button6)
        scrollView.addSubview(button7)
        scrollView.addSubview(button8)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされた位置を取得
        let touch:UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        //もし,imageIndexが0でない　（押すスタンプが選ばれていない）とき
        if imageIndex != 0 {
            //スタンプサイズを40pxの正方形に指定（UIImageViewの位置やサイズを指定してインスタンスを作る）
            stampImageView = UIImageView(frame: CGRect(x: 0, y:0, width: 40, height: 40))
            
            //押されたスタンプの画像を指定
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            stampImageView.image = image
            
            //タッチされた位置に画像を置く
            stampImageView.center = CGPoint(x: location.x ,y : location.y)
            print(stampImageView.center.y)
            let y = stampImageView.center.y
            if y < 400 {
                self.view.addSubview(stampImageView)
                
            }else{
                
            }
        }
    }
    
    
    //Pinterest
    @IBAction func web() {
        self.performSegue(withIdentifier: "result", sender: nil)
    }
    
    //削除
    @IBAction func move() {
        self.stampImageView.removeFromSuperview()
    }
    
    //撮影
    @IBAction func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {       //カメラが使えるかの確認
            let picker = UIImagePickerController()                        // イメージピッカーを作成
            picker.sourceType = .camera                                   // デリゲートの設定先を設定
            picker.delegate = self                                        // 取得した画像を編集するかの設定
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        } else {                                                          //カメラを使えないときはエラーがコンソールに出ます
            print("error")
        }
    }
    
    //編集した画像に保存するためのメソッド
    @IBAction func savePhoto() {
        UIImageWriteToSavedPhotosAlbum(cameraImageView.image!, nil, nil, nil)
    }
    
    //表示している画像にフィイルターを加工する時のメソッド
    @IBAction func colorFilter() {
        let filterImage: CIImage = CIImage(image: originalImage)!
        //フィルターの設定
        filter = CIFilter(name: "CIColorControls")!
        filter.setValue(filterImage, forKey: kCIInputImageKey)
        //彩度の調整
        filter.setValue(1.0, forKey: "inputSaturation")
        //明度の調整
        filter.setValue(0.5, forKey: "inputBrightness")
        //コントラストの調整
        filter.setValue(2.5, forKey: "inputContrast")
        let ctx = CIContext(options: nil)
        let cgImage = ctx.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
        cameraImageView.image = UIImage(cgImage: cgImage!)
    }
    
    
    //カメラロールにある画像を読み込む時のメソッド
    @IBAction func openAlbum() {
        //カメラロールを使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //カメラロールの画像を選択して画像を表示するまでの一連の流れ
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    }
    
    
    //SNSに編集した画像を投稿したい時のメソッド
    @IBAction func snsPhoto() {
        //投稿する時に一緒に乗せるコメント
        let shareText = "写真加工いえい"
        //投稿する画像の選択
        let shareImage = cameraImageView.image
        //投稿するコメントと画像の準備
        let activityItems: [Any] = [shareText, shareImage]
        let activityViewController = UIActivityViewController(activityItems: activityItems,applicationActivities: nil)
        let excludedAcivityTypes = [UIActivityType.postToWeibo, .saveToCameraRoll, .print]
        activityViewController.excludedActivityTypes = excludedAcivityTypes
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

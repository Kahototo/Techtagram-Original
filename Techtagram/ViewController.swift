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
    
    @IBOutlet var cameraImageView: UIImageView!
    
    let stamp = UIImage(named: "おじさん.png") // スタンプ画像

    //スタンプ画像の名前が入った配列
    var imageNameArray: [String] = ["hukidashi1.png", "hukidashi2.png", "hukidashi3.png", "hurt.jpg"]
    
    //選択しているスタンプ画像の番号
    var imageIndex: Int = 0
    
    //スタンプ画像が入るImageView
    var ImageView: UIImageView!
    
    //画像を加工するための元となる画像
    var originalImage: UIImage!
    
    //画像を加工するフィルターの宣言
    var filter: CIFilter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされた位置を取得
        let touch:UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        //もし,imageIndexが0でない　（押すスタンプが選ばれていない）とき
        if imageIndex != 0 {
            //スタンプサイズを40pxの正方形に指定（UIImageViewの位置やサイズを指定してインスタンスを作る）
            ImageView = UIImageView(frame: CGRect(x: 0, y:0, width: 40, height: 40))
            
            //押されたスタンプの画像を指定
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            ImageView.image = image
            
            //タッチされた位置に画像を置く
            ImageView.center = CGPoint(x: location.x ,y : location.y)
            
            //UIImageViewを画面に表示（selfとはViewControllerのことで、ViewControllerの画面上self.viewにimageViewというもの(Subview)を加える(add)という意味になる）
            self.view.addSubview(ImageView)
            
        }
    }
    
    @IBAction func web() {
        self.performSegue(withIdentifier: "result", sender: nil)
    }
    
    
    @IBAction func selectedFirst() {
        imageIndex = 1
    }
    
    @IBAction func selectedSecond() {
        imageIndex = 2
    }
    
    @IBAction func selectedThird() {
        imageIndex = 3
    }
    
    @IBAction func selectedFourth() {
        imageIndex = 4
    }
    
    //"撮影する"ボタンを押した時のメソッド
    @IBAction func takePhoto() {
        //カメラが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            //カメラを起動 // イメージピッカーを作成
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            // デリゲートの設定先を設定
            picker.delegate = self
            // 取得した画像を編集するかの設定
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
        } else {
            //カメラを使えないときはエラーがコンソールに出ます
            print("error")
        }
    }
    
    //カメラ、カメラロールを使ったときに選択した画像をアプリ内に表示するためのメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
          //↑意味(info＝情報)
        
        let stampView = cameraImageView.subviews
        
         //カメラで写真を撮った後にその画像を加工する前の元画像として記憶しておく
        originalImage = cameraImageView.image
        cameraImageView.addSubview(UIImageView(image: stamp))     // スタンプ画像を合成する
        
        // ----- 合成した画像を保存する
        UIGraphicsBeginImageContext(cameraImageView.bounds.size)
        cameraImageView.layer.render(in: UIGraphicsGetCurrentContext()!)
        UIImageWriteToSavedPhotosAlbum(UIGraphicsGetImageFromCurrentImageContext()!, self, nil, nil)
        UIGraphicsEndImageContext()

        //アプリ画面へ戻る
        dismiss(animated: true, completion: nil)
        //↑どういう意味(dismiss＝退ける)
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
    
    @IBAction func move() {
        //UIImageを画面から削除(selfはViewControllerのこと。ViewControllerのImageViewを画面上(Superview)から取り除く)
        self.ImageView.removeFromSuperview()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

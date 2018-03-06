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
    
    
    //スタンプ画像の名前が入った配列
    var imageNameArray: [String] = ["stamp1.png", "stamp2.png", "stamp3.png", "stamp4.png","stamp5.png", "stamp6.png", "stamp7.png", "stamp8.png", "stamp9.png", "stamp10.png", "stamp11.png", "stamp12.png", "stamp13.png","stamp14.png", "stamp15.png", "stamp16.png", "stamp17.png", "stamp18.png","stamp19.png", "stamp20.png", "stamp21.png", "stamp22.png", "stamp23.png", "stamp24.png", "stamp25.png","stamp26.png", "stamp27.png", "stamp28.png","stamp29.png", "stamp30.png"]
    
    //選択しているスタンプ画像の番号
    var imageIndex: Int = 0
    
    //スタンプ画像が入るImageView
    var stampImageView: UIImageView!
    
    //画像を加工するための元となる画像
    var originalImage: UIImage!
    
    //画像を加工するフィルターの宣言
    var filter: CIFilter!
    
//    //ピンチジェスチャー
//    var pinchGesture  = UIPinchGestureRecognizer()
    
    // UIImage のインスタンスを設定
    let image1:UIImage = UIImage(named:"stamp1.png")!
    let image2:UIImage = UIImage(named:"stamp2.png")!
    let image3:UIImage = UIImage(named:"stamp3.png")!
    let image4:UIImage = UIImage(named:"stamp4.png")!
    let image5:UIImage = UIImage(named:"stamp5.png")!
    let image6:UIImage = UIImage(named:"stamp6.png")!
    let image7:UIImage = UIImage(named:"stamp7.png")!
    let image8:UIImage = UIImage(named:"stamp8.png")!
    let image9:UIImage = UIImage(named:"stamp9.png")!
    let image10:UIImage = UIImage(named:"stamp10.png")!
    let image11:UIImage = UIImage(named:"stamp11.png")!
    let image12:UIImage = UIImage(named:"stamp12.png")!
    let image13:UIImage = UIImage(named:"stamp13.png")!
    let image14:UIImage = UIImage(named:"stamp14.png")!
    let image15:UIImage = UIImage(named:"stamp15.png")!
    let image16:UIImage = UIImage(named:"stamp16.png")!
    let image17:UIImage = UIImage(named:"stamp17.png")!
    let image18:UIImage = UIImage(named:"stamp18.png")!
    let image19:UIImage = UIImage(named:"stamp19.png")!
    let image20:UIImage = UIImage(named:"stamp20.png")!
    let image21:UIImage = UIImage(named:"stamp21.png")!
    let image22:UIImage = UIImage(named:"stamp22.png")!
    let image23:UIImage = UIImage(named:"stamp23.png")!
    let image24:UIImage = UIImage(named:"stamp24.png")!
    let image25:UIImage = UIImage(named:"stamp25.png")!
    let image26:UIImage = UIImage(named:"stamp26.png")!
    let image27:UIImage = UIImage(named:"stamp27.png")!
    let image28:UIImage = UIImage(named:"stamp28.png")!
    let image29:UIImage = UIImage(named:"stamp29.png")!
    let image30:UIImage = UIImage(named:"stamp30.png")!
   
    
    // UIButton のインスタンスを生成
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let button10 = UIButton()
    let button11 = UIButton()
    let button12 = UIButton()
    let button13 = UIButton()
    let button14 = UIButton()
    let button15 = UIButton()
    let button16 = UIButton()
    let button17 = UIButton()
    let button18 = UIButton()
    let button19 = UIButton()
    let button20 = UIButton()
    let button21 = UIButton()
    let button22 = UIButton()
    let button23 = UIButton()
    let button24 = UIButton()
    let button25 = UIButton()
    let button26 = UIButton()
    let button27 = UIButton()
    let button28 = UIButton()
    let button29 = UIButton()
    let button30 = UIButton()
    

    
    
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
    @IBAction func pushStamp9(sender:UIButton) {
        imageIndex = 9
    }
    @IBAction func pushStamp10(sender:UIButton) {
        imageIndex = 10
    }
    @IBAction func pushStamp11(sender:UIButton) {
        imageIndex = 11
    }
    @IBAction func pushStamp12(sender:UIButton) {
        imageIndex = 12
    }
    @IBAction func pushStamp13(sender:UIButton) {
        imageIndex = 13
    }
    @IBAction func pushStamp14(sender:UIButton) {
        imageIndex = 14
    }
    @IBAction func pushStamp15(sender:UIButton) {
        imageIndex = 15
    }
    @IBAction func pushStamp16(sender:UIButton) {
        imageIndex = 16
    }
    @IBAction func pushStamp17(sender:UIButton) {
        imageIndex = 17
    }
    @IBAction func pushStamp18(sender:UIButton) {
        imageIndex = 18
    }
    @IBAction func pushStamp19(sender:UIButton) {
        imageIndex = 19
    }
    @IBAction func pushStamp20(sender:UIButton) {
        imageIndex = 20
    }
    @IBAction func pushStamp21(sender:UIButton) {
        imageIndex = 21
    }
    @IBAction func pushStamp22(sender:UIButton) {
        imageIndex = 22
    }
    @IBAction func pushStamp23(sender:UIButton) {
        imageIndex = 23
    }
    @IBAction func pushStamp24(sender:UIButton) {
        imageIndex = 24
    }
    @IBAction func pushStamp25(sender:UIButton) {
        imageIndex = 25
    }
    @IBAction func pushStamp26(sender:UIButton) {
        imageIndex = 26
    }
    @IBAction func pushStamp27(sender:UIButton) {
        imageIndex = 27
    }
    @IBAction func pushStamp28(sender:UIButton) {
        imageIndex = 28
    }
    @IBAction func pushStamp29(sender:UIButton) {
        imageIndex = 29
    }
    @IBAction func pushStamp30(sender:UIButton) {
        imageIndex = 30
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        // ボタンの設置座標とサイズを設定する.
        button1.frame = CGRect(x: 25, y: 20, width: 30, height: 30)
        button2.frame = CGRect(x: 94, y: 20, width: 30, height: 30)
        button3.frame = CGRect(x: 165, y: 20, width: 30, height: 30)
        button4.frame = CGRect(x: 235, y: 20, width: 30, height: 30)
        button5.frame = CGRect(x: 306, y: 20, width: 30, height: 30)
        button6.frame = CGRect(x: 375, y: 20, width: 30, height: 30)
        button7.frame = CGRect(x: 442, y: 20, width: 30, height: 30)
        button8.frame = CGRect(x: 515, y: 20, width: 30, height: 30)
        button9.frame = CGRect(x: 585, y: 20, width: 30, height: 30)
        button10.frame = CGRect(x: 665, y: 20, width: 30, height: 30)
        button11.frame = CGRect(x: 745, y: 20, width: 30, height: 30)
        button12.frame = CGRect(x: 825, y: 20, width: 30, height: 30)
        button13.frame = CGRect(x: 905, y: 20, width: 30, height: 30)
        button14.frame = CGRect(x: 985, y: 20, width: 30, height: 30)
        button15.frame = CGRect(x: 1065, y: 20, width: 30, height: 30)
        button16.frame = CGRect(x: 1145, y: 20, width: 30, height: 30)
        button17.frame = CGRect(x: 1225, y: 20, width: 30, height: 30)
        button18.frame = CGRect(x: 1305, y: 20, width: 30, height: 30)
        button19.frame = CGRect(x: 1385, y: 20, width: 30, height: 30)
        button20.frame = CGRect(x: 1465, y: 20, width: 30, height: 30)
        button21.frame = CGRect(x: 1545, y: 20, width: 30, height: 30)
        button22.frame = CGRect(x: 1625, y: 20, width: 30, height: 30)
        button23.frame = CGRect(x: 1705, y: 20, width: 30, height: 30)
        button24.frame = CGRect(x: 1785, y: 20, width: 30, height: 30)
        button25.frame = CGRect(x: 1865, y: 20, width: 30, height: 30)
        button26.frame = CGRect(x: 1945, y: 20, width: 30, height: 30)
        button27.frame = CGRect(x: 2025, y: 20, width: 30, height: 30)
        button28.frame = CGRect(x: 2105, y: 20, width: 30, height: 30)
        button29.frame = CGRect(x: 2185, y: 20, width: 30, height: 30)
        button30.frame = CGRect(x: 2265, y: 20, width: 30, height: 30)
        
        
        
        // button1 (buttonの画像・背景色・イベントを追加)
        button1.setImage(image1, for: .normal)
        button1.addTarget(self, action: #selector(pushStamp1(sender: )), for: .touchUpInside)
        
        // button2
        button2.setImage(image2, for: .normal)
        button2.addTarget(self, action: #selector(pushStamp2(sender: )), for: .touchUpInside)
        
        // button3
        button3.setImage(image3, for: .normal)
        button3.addTarget(self, action: #selector(pushStamp3(sender: )), for: .touchUpInside)
        
        // button4
        button4.setImage(image4, for: .normal)
        button4.addTarget(self, action: #selector(pushStamp4(sender: )), for: .touchUpInside)
        
        // button5
        button5.setImage(image5, for: .normal)
        button5.addTarget(self, action: #selector(pushStamp5(sender: )), for: .touchUpInside)
        
        // button6
        button6.setImage(image6, for: .normal)
        button6.addTarget(self, action: #selector(pushStamp6(sender: )), for: .touchUpInside)
        
        // button7
        button7.setImage(image7, for: .normal)
        button7.addTarget(self, action: #selector(pushStamp7(sender: )), for: .touchUpInside)
        
        // button8
        button8.setImage(image8, for: .normal)
        button8.addTarget(self, action: #selector(pushStamp8(sender: )), for: .touchUpInside)
        
        // button9
        button9.setImage(image9, for: .normal)
        button9.addTarget(self, action: #selector(pushStamp9(sender: )), for: .touchUpInside)
        
        // button10
        button10.setImage(image10, for: .normal)
        button10.addTarget(self, action: #selector(pushStamp10(sender: )), for: .touchUpInside)
        
        // button11
        button11.setImage(image11, for: .normal)
        button11.addTarget(self, action: #selector(pushStamp11(sender: )), for: .touchUpInside)
        
        // button12
        button12.setImage(image12, for: .normal)
        button12.addTarget(self, action: #selector(pushStamp12(sender: )), for: .touchUpInside)
        
        // button13
        button13.setImage(image13, for: .normal)
        button13.addTarget(self, action: #selector(pushStamp13(sender: )), for: .touchUpInside)
        
        // button14
        button14.setImage(image14, for: .normal)
        button14.addTarget(self, action: #selector(pushStamp14(sender: )), for: .touchUpInside)
        
        // button15
        button15.setImage(image15, for: .normal)
        button15.addTarget(self, action: #selector(pushStamp15(sender: )), for: .touchUpInside)
        
        // button16
        button16.setImage(image16, for: .normal)
        button16.addTarget(self, action: #selector(pushStamp16(sender: )), for: .touchUpInside)
        
        // button17
        button17.setImage(image17, for: .normal)
        button17.addTarget(self, action: #selector(pushStamp17(sender: )), for: .touchUpInside)
        
        // button18
        button18.setImage(image18, for: .normal)
        button18.backgroundColor = UIColor.clear
        button18.addTarget(self, action: #selector(pushStamp18(sender: )), for: .touchUpInside)
        
        // button19
        button19.setImage(image19, for: .normal)
        button19.addTarget(self, action: #selector(pushStamp19(sender: )), for: .touchUpInside)
        
        // button20
        button20.setImage(image20, for: .normal)
        button20.addTarget(self, action: #selector(pushStamp20(sender: )), for: .touchUpInside)
        
        // button21
        button21.setImage(image21, for: .normal)
        button21.addTarget(self, action: #selector(pushStamp21(sender: )), for: .touchUpInside)
        
        // button22
        button22.setImage(image22, for: .normal)
        button22.addTarget(self, action: #selector(pushStamp22(sender: )), for: .touchUpInside)
        
        // button23
        button23.setImage(image23, for: .normal)
        button23.addTarget(self, action: #selector(pushStamp23(sender: )), for: .touchUpInside)
        
        // button24
        button24.setImage(image24, for: .normal)
        button24.addTarget(self, action: #selector(pushStamp24(sender: )), for: .touchUpInside)
        
        // button25
        button25.setImage(image25, for: .normal)
        button25.addTarget(self, action: #selector(pushStamp25(sender: )), for: .touchUpInside)
        
        // button26
        button26.setImage(image26, for: .normal)
        button26.addTarget(self, action: #selector(pushStamp26(sender: )), for: .touchUpInside)
        
        // button27
        button27.setImage(image27, for: .normal)
        button27.addTarget(self, action: #selector(pushStamp27(sender: )), for: .touchUpInside)
        
        // button28
        button28.setImage(image28, for: .normal)
        button28.addTarget(self, action: #selector(pushStamp28(sender: )), for: .touchUpInside)
        
        // button29
        button29.setImage(image29, for: .normal)
        button29.addTarget(self, action: #selector(pushStamp29(sender: )), for: .touchUpInside)
        
        // button30
        button30.setImage(image30, for: .normal)
        button30.addTarget(self, action: #selector(pushStamp30(sender: )), for: .touchUpInside)
        
        
        //スクロールビューについて//
        
        //UIScrollViewのインスタンス作成
        var scrollView = UIScrollView()
        //scrollViewの大きさを設定。
        scrollView = UIScrollView(frame: CGRect(x:0, y:600, width: 375, height: 100))
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:self.view.frame.width * 6.5, height:100)
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
        scrollView.addSubview(button9)
        scrollView.addSubview(button10)
        scrollView.addSubview(button11)
        scrollView.addSubview(button12)
        scrollView.addSubview(button13)
        scrollView.addSubview(button14)
        scrollView.addSubview(button15)
        scrollView.addSubview(button16)
        scrollView.addSubview(button17)
        scrollView.addSubview(button18)
        scrollView.addSubview(button19)
        scrollView.addSubview(button20)
        scrollView.addSubview(button21)
        scrollView.addSubview(button22)
        scrollView.addSubview(button23)
        scrollView.addSubview(button24)
        scrollView.addSubview(button25)
        scrollView.addSubview(button26)
        scrollView.addSubview(button27)
        scrollView.addSubview(button28)
        scrollView.addSubview(button29)
        scrollView.addSubview(button30)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //タッチされた位置を取得
        let touch:UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        //もし,imageIndexが0でない　（押すスタンプが選ばれていない）とき
        if imageIndex != 0 {
            //スタンプサイズを40pxの正方形に指定（UIImageViewの位置やサイズを指定してインスタンスを作る）
            stampImageView = UIImageView(frame: CGRect(x: 0, y:0, width: 60, height: 50))
            
            //押されたスタンプの画像を指定
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            stampImageView.image = image
            
            //タッチされた位置に画像を置く
            stampImageView.center = CGPoint(x: location.x ,y : location.y)
            print(stampImageView.center.y)
            let y = stampImageView.center.y
            if y < 400 {
                self.view.addSubview(stampImageView)
//                pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.pincheGestureHandler))
//                self.stampImageView.isUserInteractionEnabled = true
//                self.stampImageView.addGestureRecognizer(pinchGesture)
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
    
    //カメラ、カメラロールを使ったときに選択した画像をアプリ内に表示するためのメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        cameraImageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        originalImage = cameraImageView.image
        
        dismiss(animated: true, completion: nil)
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
    
//    @objc func pincheGestureHandler(recognizer:UIPinchGestureRecognizer){
//        self.view.bringSubview(toFront: self.stampImageView)
//        recognizer.view?.transform = (recognizer.view?.transform)!.scaledBy(x: recognizer.scale, y: recognizer.scale)
//        recognizer.scale = 1.0
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

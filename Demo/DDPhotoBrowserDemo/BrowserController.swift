//
//  BrowserController.swift
//  DDPhotoBrowserDemo
//
//  Created by USER on 2018/12/13.
//  Copyright © 2018 dd01.leo. All rights reserved.
//

import UIKit
import Kingfisher
class BrowserController: UIViewController {
    @IBOutlet weak var imageViewA: UIImageView!
    @IBOutlet weak var imageViewB: UIImageView!
    @IBOutlet weak var imageViewC: UIImageView!
    @IBOutlet weak var imageViewD: UIImageView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        addTap()
    }
    
    deinit {
        print(self)
    }

    func addTap() {
        imageViewA.isUserInteractionEnabled = true
        imageViewB.isUserInteractionEnabled = true
        imageViewC.isUserInteractionEnabled = true
        imageViewD.isUserInteractionEnabled = true
        
        imageViewA.contentMode = .scaleAspectFill
        imageViewB.contentMode = .scaleAspectFill
        imageViewC.contentMode = .scaleAspectFill
        imageViewD.contentMode = .scaleAspectFill
        
        imageViewA.clipsToBounds = true
        imageViewB.clipsToBounds = true
        imageViewC.clipsToBounds = true
        imageViewD.clipsToBounds = true
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tagAGesture))
        imageViewA.addGestureRecognizer(tap1)
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tagBGesture))
        imageViewB.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tagCGesture))
        imageViewC.addGestureRecognizer(tap3)
        
        let tap4 = UITapGestureRecognizer(target: self, action: #selector(tagDGesture))
        imageViewD.addGestureRecognizer(tap4)
        
        let url1 = URL(string: "http://dd01-test-d0.oss-cn-shenzhen.aliyuncs.com/20181206/4e363dcddb474efa4d1d2bc209acf5fe.jpeg")
        imageViewA.kf.setImage(with: url1)
        
        let url2 = URL(string: "http://dd01-test-d0.oss-cn-shenzhen.aliyuncs.com/20181207/0ed36a0dea9c7feaf2e4886c393adfb7.jpeg")
        imageViewB.kf.setImage(with: url2)
        
        let url3 = URL(string: "http://img1.mydrivers.com/img/20171008/s_da7893ed38074cbc994e0ff3d85adeb5.jpg")
        imageViewC.kf.setImage(with: url3)
        
        let url4 = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533056728983&di=0377ea3d0ef5acdefe8863c1657a67f4&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01e90159a5094ba801211d25bec351.jpg")
        
        //        let url4 = URL(string: "https://i10.hoopchina.com.cn/hupuapp/bbs/154271663700897/thread_154271663700897_20181211163908_s_6365730_w_360_h_209_99511.gif")
        imageViewD.kf.setImage(with: url4)
    }
    
    @objc func tagAGesture() {
        
        showImage(index: 0)
    }
    
    @objc func tagBGesture() {
        showImage(index: 1)
        
    }
    
    @objc func tagCGesture() {
        showImage(index: 2)
        
    }
    
    @objc func tagDGesture() {
        showImage(index: 3)
        
    }
    
    func showImage(index: Int) {
        var photos = [DDPhoto]()
        
        let photo1 = DDPhoto()
        photo1.url = URL(string: "http://dd01-test-d0.oss-cn-shenzhen.aliyuncs.com/20181206/4e363dcddb474efa4d1d2bc209acf5fe.jpeg")
        photo1.sourceImageView = imageViewA
        
        let photo2 = DDPhoto()
        photo2.url = URL(string: "http://dd01-test-d0.oss-cn-shenzhen.aliyuncs.com/20181207/0ed36a0dea9c7feaf2e4886c393adfb7.jpeg")
        photo2.sourceImageView = imageViewB
        
        let photo3 = DDPhoto()
        photo3.url = URL(string: "http://img1.mydrivers.com/img/20171008/s_da7893ed38074cbc994e0ff3d85adeb5.jpg")
        photo3.sourceImageView = imageViewC
        
        let photo4 = DDPhoto()
        //        photo4.url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533056728983&di=0377ea3d0ef5acdefe8863c1657a67f4&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01e90159a5094ba801211d25bec351.jpg")
        photo4.url = URL(string: "https://i10.hoopchina.com.cn/hupuapp/bbs/154271663700897/thread_154271663700897_20181211163908_s_6365730_w_360_h_209_99511.gif")
        
        //        https://i10.hoopchina.com.cn/hupuapp/bbs/154271663700897/thread_154271663700897_20181211163908_s_6365730_w_360_h_209_99511.gif
        photo4.sourceImageView = imageViewD
        
        photos.append(photo1)
        photos.append(photo2)
        photos.append(photo3)
        photos.append(photo4)
        
        let browser = DDPhotoBrower.photoBrowser(Photos: photos, currentIndex: index)
        browser.delegate = self
        browser.show()
    }

}


extension BrowserController : DDPhotoBrowerDelegate {
    
    /// 索引值改变
    ///
    /// - Parameter index: 索引
    func photoBrowser(controller: DDPhotoBrowerController?, didChanged index: Int?) {
        print("didChanged")
    }
    
    /// 单击事件，即将消失
    ///
    /// - Parameter index: 索引
    func photoBrowser(controller: DDPhotoBrowerController?, willDismiss index: Int?) {
        print("willDismiss")

    }
    
    /// 长按事件事件
    ///
    /// - Parameter index: 索引
    func photoBrowser(controller: DDPhotoBrowerController?, longPress index: Int?) {
        print("longPress")
    }
}
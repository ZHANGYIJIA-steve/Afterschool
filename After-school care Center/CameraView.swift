import UIKit

import Foundation

class CameraView: UIView {



    var cameraButton : UIButton!



    var photoButton : UIButton!



    var image : UIImageView!



    override init(frame : CGRect)



    {



        super.init(frame: frame)



        cameraButtonMethods()



        photoButtonMethods()



        imageMethods()



    }



    required init?(coder aDecoder: NSCoder) {



        fatalError("init(coder:) has not been implemented")



    }

func cameraButtonMethods(){





        cameraButton = UIButton(type: .custom)



        cameraButton.frame = CGRect(x: 20, y: 400, width: 100, height: 40)



        cameraButton.setTitle("调用相册", for: .normal)



        cameraButton.backgroundColor = UIColor.blue



        self.addSubview(cameraButton)



    }







    func photoButtonMethods(){



        photoButton = UIButton(type: .custom)



        photoButton.frame = CGRect(x: 255, y: 400, width: 100, height: 40)



        photoButton.backgroundColor = UIColor.blue



        photoButton.setTitle("调用相机", for: .normal)



        self.addSubview(photoButton)



    }







    func imageMethods(){



        image = UIImageView()



        image.image = UIImage(named: "image")



        image.frame = CGRect(x: 20, y: 40, width: 335, height: 335)



        self.addSubview(image)



    }

}

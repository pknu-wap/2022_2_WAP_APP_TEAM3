import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wap_library/components/custom_text_form_field.dart';
import 'package:wap_library/components/custom_textarea.dart';
import 'package:wap_library/util/vaildator_util.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/camera.dart';

/// 사진 추가하기 팝업!
/*class CameraDialog extends StatefulWidget {
  const CameraDialog({Key? key}) : super(key: key);

  @override
  _CameraDialogState createState() => _CameraDialogState();
}

class _CameraDialogState extends State<CameraDialog> {
  File? _image;
  final picker = ImagePicker();
  var _uploadedImage;

  /// 비동기 처리를 통해 카메라와 갤러리에서 이미지를 가져온다.
  @override
  Future getImage(ImageSource imageSource) async {
    _uploadedImage = await picker.pickImage(source: imageSource);

    setState(() {
      _image = File(_uploadedImage!.path);
    });
  }

/*
  void _updateSelectedImage(File image) {
    setState(() {
      _uploadedImage = image;
    });
  }
*/
  // 이미지를 보여주는 위젯
  Widget showImage() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 25),
        color: const Color(0xffd0cece),
        width: 200,
        height: 300,
        child: Center(
            child: _image == null
                ? Text('이미지를 선택하세요.')
                : Image.file(File(_image!.path))));
  }

  @override
  Widget build(BuildContext context) {
    ///화면 세로 고정
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: EdgeInsets.all(10),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                /// 카메라 촬영 버튼
                FloatingActionButton(
                  backgroundColor: Color(0xff2D3C72),
                  child: Icon(Icons.add_a_photo),
                  tooltip: 'pick Iamge',
                  onPressed: () {
                    getImage(ImageSource.camera);
                  },
                ),

                /// 갤러리에서 이미지를 가져오는 버튼
                FloatingActionButton(
                  backgroundColor: Color(0xff2D3C72),
                  child: Icon(Icons.wallpaper),
                  tooltip: 'pick Image',
                  onPressed: () {
                    getImage(ImageSource.gallery);
                  },
                ),
              ],
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "취소",
              style: TextStyle(color: Color(0xff2D3C72), fontSize: 17),
            )),
        TextButton(
            onPressed: () {
              Navigator.pop(context, _image);
            },
            child: Text("확인", style: TextStyle(fontSize: 17)))
      ],
    );
  }
}*/
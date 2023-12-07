// import 'package:flutter/material.dart';

// class ImagePickerProvider with ChangeNotifier{
//   final ImagePicker imagePicker = ImagePicker();
//   Xfile? pickedImage;

//   void pickFromCamera() async{
//  pickedImage = await imagePicker.pickImage(
//               source: ImageSource.gallery,
//             );
//   }
//   void pickFromGallery(){
//     pickedImage = await imagePicker.pickImage(
//               source: ImageSource.camera,
//             );
//   }
//   void removeImagePicker(){
//       pickedImage = null;
//   }
// }
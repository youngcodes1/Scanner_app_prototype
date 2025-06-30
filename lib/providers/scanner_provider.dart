import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScannerProvider extends ChangeNotifier {
  File? _image;
  bool _isScanning = false;
  bool? _isVerified;

  final ImagePicker _picker = ImagePicker();

  File? get image => _image;
  bool get isScanning => _isScanning;
  bool? get isVerified => _isVerified;

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _isScanning = true;
      _isVerified = null;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 2));

      _isScanning = false;
      _isVerified = pickedFile.path.length % 2 == 0; 
      notifyListeners();
    }
  }
}

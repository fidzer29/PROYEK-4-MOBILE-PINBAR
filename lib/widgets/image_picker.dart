import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerButton extends StatefulWidget {
  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  File? _image;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: _pickImage,
            child: Text('Pilih Gambar', style: primaryTextStyle),
            style: ElevatedButton.styleFrom(
              backgroundColor: warnatulisan,
            )),
        if (_image != null) Image.file(_image!),
      ],
    );
  }
}

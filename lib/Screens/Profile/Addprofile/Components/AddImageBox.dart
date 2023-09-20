import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AddImageBox extends StatefulWidget {
  final Color themeColor;
  final Function(File)? onPickdFile;

  const AddImageBox({super.key, required this.themeColor, this.onPickdFile});

  @override
  State<AddImageBox> createState() => _AddImageBoxState();
}

class _AddImageBoxState extends State<AddImageBox> {
  File? selectImage;

  selectAFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpg', 'png'],
    );
    if (result != null) {
      selectImage = File(result.files.first.path.toString());
      widget.onPickdFile != null ? widget.onPickdFile!(selectImage!) : null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectAFile,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 130,
          height: 130,
          color: widget.themeColor,
          child: Builder(builder: (context) {
            if (selectImage != null) {
              return Image.file(
                selectImage!,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              );
            }
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Color(0xFF383838),
                  size: 20,
                ),
                SizedBox(height: 4),
                Opacity(
                  opacity: 0.80,
                  child: Text(
                    'Add Image',
                    style: TextStyle(
                      color: Color(0xFF383838),
                      fontSize: 12,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

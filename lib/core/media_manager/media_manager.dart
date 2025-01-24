import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/app_colors.dart';

class MediaManager {

  static Future<File?> pickFile() async{
    final pickedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'PDF'],
    );
    if(pickedFile == null || pickedFile.files.isEmpty) return null;
    return File(pickedFile.files.first.path!);
  }

  static Future<File?> pickVideoFromGallery()async{
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if(pickedFile == null) return null;
    return File(pickedFile.path);
  }

  static Future<File?> pickImageFromGallery()async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickedFile == null) return null;
    return File(pickedFile.path);
  }

  static Future<File?> pickImageFromCamera()async{
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera,maxHeight: 500,maxWidth: 1024, imageQuality: 75);
    if(pickedFile == null) return null;
    return File(pickedFile.path);
  }

  /// final file = await MediaManager.showImageDialog();
  /// instead of
  /// final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  static Future<File?> showImageDialog() async {
    final file = await showCupertinoDialog(
      context: RouteUtils.context,
      barrierDismissible: true,
      builder: (BuildContext context) => _ImageDialog(),
    );
    return file;
  }

  static Future<File?> loadFileFromUrl(String url) async {
    try {
      final sp = await SharedPreferences.getInstance();
      List<String> downloadedFiles = sp.getStringList('files') ?? [];
      final documentDirectory = await getApplicationDocumentsDirectory();
      final filePath = documentDirectory.path + '/' + Utils.getFileNameFromURL(url, '/');
      if (downloadedFiles.contains(filePath)) {
        return File(filePath);
      }
      await Dio().download(
        url,
        filePath,
      );
      downloadedFiles.insert(0, filePath);
      sp.setStringList('files', downloadedFiles);
      return File(filePath);
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>> get getSavedFiles async {
    final sp = await SharedPreferences.getInstance();
    List<String> downloadedFiles = sp.getStringList('files') ?? [];
    return downloadedFiles;
  }

  static Future<bool> deleteSavedFile(File file) async {
    try {
      final sp = await SharedPreferences.getInstance();
      List<String> downloadedFiles = sp.getStringList('files') ?? [];
      downloadedFiles.remove(file.path);
      sp.setStringList('files', downloadedFiles);
      return true;
    } catch (e) {
      return false;
    }
  }

  // static Future<File?> cropImage(String filePath) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: filePath,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //         toolbarTitle: '',
  //         toolbarColor: Colors.black,
  //         toolbarWidgetColor: Colors.white,
  //         initAspectRatio: CropAspectRatioPreset.original,
  //         hideBottomControls: true,
  //         lockAspectRatio: false,
  //       ),
  //       IOSUiSettings(
  //         title: '',
  //         aspectRatioLockEnabled: false,
  //         hidesNavigationBar: true,
  //       ),
  //     ],
  //   );
  //   if (croppedFile != null) {
  //     return File(croppedFile.path);
  //   }
  //   return null;
  // }

}

class _ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Capture the Image from ...'.tr(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      actions: [
        CupertinoButton(
          child: Text(
            'Camera'.tr(),
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          onPressed: () async {
            final file = await MediaManager.pickImageFromCamera();
            Navigator.pop(context, file);
          },
        ),
        CupertinoButton(
          child: Text(
            'Studio'.tr(),
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          onPressed: () async {
            final file = await MediaManager.pickImageFromGallery();
            Navigator.pop(context, file);
          },
        ),
        CupertinoButton(
          child: Text(
            'Cancel'.tr(),
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
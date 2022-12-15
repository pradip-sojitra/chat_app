import 'dart:io';
import 'package:chat_app/components/Cupertino_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  File? imageConfirm;

  void showDialogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Select Profile Picture"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoRowButtons(
                buttonName: "Select From Gallery",
                icon: Icons.photo,
                onPressed: () {
                  imageSelected(ImageSource.gallery);
                },
              ),
              CupertinoRowButtons(
                buttonName: "Select From Camera",
                icon: Icons.camera_alt,
                onPressed: () {
                  imageSelected(ImageSource.camera);
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> imageSelected(ImageSource source) async {

    Navigator.of(context).pop();
    XFile? pickFile = await ImagePicker().pickImage(source: source);

    if (pickFile != null) {
      croppedImage(pickFile);
    }
  }

  Future<void> croppedImage(XFile sourceImage) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: sourceImage.path,
      compressQuality: 40,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
    );

    if (croppedFile != null) {
      setState(() {
        imageConfirm = File(croppedFile.path);
      });
    }
  }

  checkValue() {}

  signup() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Form(
              child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: ListView(
              children: [
                CupertinoButton(
                  onPressed: () {
                    showDialogBox();
                  },
                  child: CircleAvatar(
                    backgroundImage:
                        imageConfirm != null ? FileImage(imageConfirm!) : null,
                    radius: 80,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: fullNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your FullName"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your Email"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: "Enter your Password"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: confirmPasswordController,
                  textInputAction: TextInputAction.next,
                  decoration:
                      InputDecoration(hintText: "Enter your confirm Password"),
                ),
                const SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  child: CupertinoButton(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.blue,
                    child: Text("SignUp"),
                    onPressed: () {
                      checkValue();
                    },
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

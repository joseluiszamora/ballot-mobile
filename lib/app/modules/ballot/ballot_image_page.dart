import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mobiletelefericovirtual/app/global_widgets/app_bar/main_app_bar_widget.dart';
import 'package:mobiletelefericovirtual/app/routes/app_routes.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';
import 'package:mobiletelefericovirtual/app/components/imageComponents.dart';
import 'package:mobiletelefericovirtual/app/utils/dialogs.dart';
import 'package:progress_dialog/progress_dialog.dart';

class BallotImagePage extends StatefulWidget {
  final String imagenUsuario;
  final String imagenCiAnverso;
  final String imagenCiReverso;

  const BallotImagePage(
      {Key key, this.imagenUsuario, this.imagenCiAnverso, this.imagenCiReverso})
      : super(key: key);
  @override
  _BallotImagePageState createState() => _BallotImagePageState();
}

class _BallotImagePageState extends State<BallotImagePage> {
  File imageFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    //final registerRepository = Provider.of<RegisterRepository>(context);
    String title = "";
    String imageDefault = "";
    String type = "image";

    _onWillPop() {
      //registerRepository.returnSecondStep();
    }

    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: MainAppBarWidget(title: 'IMAGEN ACTA'),
          body: Container(
            decoration: Styles().backgroundMain(),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Container(
                        child: Center(
                            child: imageFile != null
                                ? imageFromFile(imageFile, 200, type)
                                : defaultImage(50, type)),
                      )),
                  Container(
                      child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 30.0, right: 30.0, bottom: 10.0),
                            child: Row(children: <Widget>[
                              Flexible(
                                  flex: 1,
                                  child: FlatButton(
                                      onPressed: () {
                                        _openGallery(context);
                                      },
                                      child: Row(children: [
                                        Icon(Icons.image, color: Colors.white),
                                        Text("GALERIA")
                                      ]))),
                              SizedBox(width: 5.0),
                              Flexible(
                                  flex: 1,
                                  child: FlatButton(
                                      onPressed: () {
                                        _openCamera(context);
                                      },
                                      child: Row(children: [
                                        Icon(Icons.camera_alt,
                                            color: Colors.white),
                                        Text("CAMARA")
                                      ]))),
                            ]),
                          ))),
                  SizedBox(height: 10),
                  Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 30.0, right: 30.0, bottom: 10.0),
                        child: FlatButton(
                            onPressed: () {
                              saveFileToServer(imageFile);
                            },
                            child: Row(children: [
                              Icon(Icons.camera_alt, color: Colors.white),
                              Text("GUARDAR Y CONTINUAR")
                            ])),
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ])),
          ),
        ));
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Recortar Imagen',
            toolbarColor: Styles().colorPrimary,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Recortar Imagen',
        ));
    if (croppedFile != null) {
      setState(() {
        imageFile = croppedFile;
      });
    }
  }

  void _openGallery(BuildContext context) async {
    var pickedFile = await picker.getImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 800,
        maxHeight: 500);
    if (pickedFile != null) {
      this.setState(() {
        imageFile = File(pickedFile.path);
      });
      _cropImage();
    }
  }

  void _openCamera(BuildContext context) async {
    var pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxWidth: 800,
        maxHeight: 500);
    if (pickedFile != null) {
      this.setState(() {
        imageFile = File(pickedFile.path);
      });
      _cropImage();
    }
  }

  Future<void> saveFileToServer(File file) async {
    ProgressDialog progressDialog = new ProgressDialog(context,
        type: ProgressDialogType.Normal,
        textDirection: TextDirection.rtl,
        isDismissible: false);
    progressDialog.style(
        message: 'Guardando Imagen',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut);

    await progressDialog.show();

    if (file != null) {
      try {
        /*final String base64 = fileToBase64(file);
        var response = await HttpImagen().saveImage(
            "12345699", widget.ype, "data:image/png;base64, $base64");
        var responseBody = jsonDecode(response.body);
        print(responseBody);*/

        progressDialog.hide();

        Get.offNamed(AppRoutes.BALLOT_SUCCESS);
        /*switch (response.statusCode) {
          case 500:
            showDialogAlert(
                context, "Error al guardar imagen", responseBody["error"], "Ok",
                () {
              Navigator.pop(context);
            }, () {
              Navigator.pop(context);
            });
            break;
          case 200:
            switch (widget.ype) {
              case "image":
                registerRepository.saveImageUser(responseBody["path"]);
                break;
              case "ci_anverso":
                registerRepository.saveImageCiAnverso(responseBody["path"]);
                break;
              case "ci_reverso":
                registerRepository.saveImageCiReverso(responseBody["path"]);
                break;
            }
            break;
          default:
            showDialogError(context);
            break;
        }*/
      } catch (e) {
        showDialogError(context);
        progressDialog.hide();
      }
    } else {
      progressDialog.hide();
      //MainHelpers().showToastBottom('Ninguna imagen seleccionada');
      //registerRepository.returnSecondStep();
    }
  }
}

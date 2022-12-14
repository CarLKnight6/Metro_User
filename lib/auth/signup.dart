import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_user/auth/signup2.dart';
import 'package:taxi_user/services/providers/destination_provider.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/delegate/search_brgy.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:taxi_user/widgets/textfields/contactnumber_field.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';
import 'package:taxi_user/widgets/textfields/password_field.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

import '../widgets/dialogs/error_dialog.dart';

class SignupPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _firstnameController = TextEditingController();

  final _lastnameController = TextEditingController();

  final _contactnumberController = TextEditingController();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmpasswordController = TextEditingController();

  var dropDownValue1 = 1;

  var province = 'Sample 1';
  var dropDownValue2 = 1;

  var city = 'Sample 1';
  var dropDownValue3 = 1;

  var brgy = 'Sample 1';

  var hasLoaded = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

  Future<void> uploadPicture(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = (await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920))!;

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: AlertDialog(
                title: Row(
              children: const [
                CircularProgressIndicator(
                  color: Colors.black,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Loading . . .',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'QRegular'),
                ),
              ],
            )),
          ),
        );

        await firebase_storage.FirebaseStorage.instance
            .ref('Users/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('Users/$fileName')
            .getDownloadURL();

        setState(() {
          hasLoaded = true;
        });

        Navigator.of(context).pop();
      } on firebase_storage.FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  List<String> listProvince = ['Cagayan', 'Isabela', 'Nueva Vizcaya'];

  List<String> listCity = [
    'Abulug',
    'Alcala',
    'Allacapan',
    'Amulung',
    'Aparri',
    'Baggao',
    'Ballesteros',
    'Buguey',
    'Calayan',
    'Camalaniugan',
    'Claveria',
    'Enrile',
    'Gattaran',
    'Gonzaga',
    'Iguig',
    'Lal-lo',
    'Lasam',
    'Pamplona',
    'Peñablanca',
    'Piat',
    'Rizal',
    'Sanchez-Mira',
    'Santa Ana',
    'Santa Praxedes',
    'Santa Teresita',
    'Santo Niño',
    'Solana',
    'Tuao',
    'Tuguegarao',
    'Alicia',
    'Angadanan',
    'Aurora',
    'Benito Soliven',
    'Burgos',
    'Cabagan',
    'Cabatuan',
    'Cauayan',
    'Cordon',
    'Delfin Albano',
    'Dinapigue',
    'Divilacan',
    'Echague',
    'Gamu',
    'Ilagan',
    'Jones',
    'Luna',
    'Maconacon',
    'Mallig',
    'Naguilian',
    'Palanan',
    'Quezon',
    'Quirino',
    'Ramon',
    'Reina Mercedes',
    'Roxas',
    'San Agustin',
    'San Guillermo',
    'San Isidro',
    'San Manuel',
    'San Mariano',
    'San Mateo',
    'San Pablo',
    'Santa Maria',
    'Santiago',
    'Santo Tomas',
    'Tumauini',
    'Alfonso Castañeda',
    'Ambaguio',
    'Aritao',
    'Bagabag',
    'Bambang',
    'Bayombong',
    'Diadi',
    'Dupax del Norte',
    'Dupax del Sur',
    'Kasibu',
    'Kayapa',
    'Quezon',
    'Santa Fe',
    'Solano',
    'Villaverde',
  ];

  List<String> listBrgyIsabela = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.grey[300],
                width: double.infinity,
                height: 180,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        TextBold(
                            text: 'User Profile',
                            fontSize: 18,
                            color: Colors.black),
                        const SizedBox(
                          width: 30,
                        ),
                      ],
                    ),
                    hasLoaded
                        ? CircleAvatar(
                            minRadius: 60,
                            maxRadius: 60,
                            backgroundColor: Colors.blue[200],
                            backgroundImage: NetworkImage(imageURL),
                          )
                        : GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 140,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              uploadPicture('camera');
                                            },
                                            leading: TextRegular(
                                              text: 'Open Camera',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            trailing: const Icon(
                                                Icons.camera_alt_rounded),
                                          ),
                                          const Divider(),
                                          ListTile(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                              uploadPicture('gallery');
                                            },
                                            leading: TextRegular(
                                              text: 'Upload Image',
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                            trailing: const Icon(Icons.image),
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: CircleAvatar(
                              minRadius: 60,
                              maxRadius: 60,
                              backgroundColor: Colors.blue[200],
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(Icons.camera_alt_rounded),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              NormalTextField(
                  controller: _firstnameController, label: 'First name'),
              NormalTextField(
                  controller: _lastnameController, label: 'Last name'),
              ContactNumberField(
                  controller: _contactnumberController,
                  label: 'Contact number'),
              TextRegular(
                  text: 'Login Credentials', fontSize: 12, color: Colors.black),
              NormalTextField(controller: _usernameController, label: 'Email'),
              PasswordField(controller: _passwordController, label: 'Password'),
              PasswordField(
                  controller: _confirmpasswordController,
                  label: 'Confirm Password'),
              TextRegular(
                  text: 'Other Information', fontSize: 12, color: Colors.black),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextBold(
                      text: 'Province', fontSize: 18, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                    child: DropdownButton(
                      underline: Container(color: Colors.transparent),
                      iconEnabledColor: Colors.black,
                      isExpanded: true,
                      value: dropDownValue1,
                      items: [
                        for (int i = 0; i < listProvince.length; i++)
                          DropdownMenuItem(
                            onTap: () {
                              province = listProvince[i];
                            },
                            child: Center(
                                child: Row(children: [
                              Text(listProvince[i],
                                  style: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                  ))
                            ])),
                            value: i,
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropDownValue1 = int.parse(value.toString());
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextBold(
                      text: 'City/Municipality',
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2, 20, 2),
                    child: DropdownButton(
                      underline: Container(color: Colors.transparent),
                      iconEnabledColor: Colors.black,
                      isExpanded: true,
                      value: dropDownValue2,
                      items: [
                        for (int i = 0; i < listCity.length; i++)
                          DropdownMenuItem(
                            onTap: () {
                              city = listCity[i];
                            },
                            child: Center(
                                child: Row(children: [
                              Text(listCity[i],
                                  style: const TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.black,
                                  ))
                            ])),
                            value: i,
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          dropDownValue2 = int.parse(value.toString());
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextBold(
                      text: 'Barangay', fontSize: 18, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: GestureDetector(
                  onTap: () {
                    final sessionToken = const Uuid().v4();
                    showSearch(
                        context: context, delegate: SearchBrgy(sessionToken));
                  },
                  child: Container(
                    height: 50,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Center(
                        child: TextRegular(
                            text: ref.watch(addressProvider.notifier).state,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ButtonWidget(
                  label: 'Continue',
                  color: Colors.amber,
                  onPressed: () {
                    if (_passwordController.text !=
                        _confirmpasswordController.text) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialog(label: 'Password do not match!');
                          });
                    } else if (_passwordController.text.length <= 6) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialog(label: 'Password too short!');
                          });
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Signup2(
                                profilePicture: imageURL,
                                firstName: _firstnameController.text,
                                lastName: _lastnameController.text,
                                contactNumber: _contactnumberController.text,
                                email: _usernameController.text,
                                password: _passwordController.text,
                                province: province,
                                city: city,
                                brgy: brgy,
                              )));
                    }
                  }),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

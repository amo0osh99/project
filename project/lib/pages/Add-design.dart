//@dart=2.9

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project/model/fooditem.dart';
import 'package:project/model/product.dart';
import 'package:project/model/productpage.dart';
import 'package:project/model/style.dart';
import 'package:path/path.dart' as Path;
import 'package:project/register/logout.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AddDPage extends StatefulWidget {
  final String pageTitle;

  AddDPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _AddDPageState createState() => _AddDPageState();
}

File _image;
firebase_storage.Reference ref;

class _AddDPageState extends State<AddDPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      storeTab(context),
      Text('Tab2'),
      Text('Tab3'),
      Text('Tab4'),
      Text('Tab5'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Add design", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: _tabs[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//add picture
  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Colors.black,
              child: _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        _image,
                        width: 150,
                        height: 150,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  _imgFromCamera() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = File(image?.path);
      _uploadImage();
    });
  }

  _uploadImage() async {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No file was selected,Please Select Image'),
      ));
      return;
    } else {
      String uid = FirebaseAuth.instance.currentUser.uid;
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child("images/${Path.basename(_image.path)}");
      await ref.putFile(_image).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          print(value);
          FirebaseDatabase.instance
              .reference()
              .child("users")
              .child(uid)
              .update({'image': value});
        }).catchError((e) {
          print(e.toString());
        });
      });
    }
  }

  _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image?.path);
      _uploadImage();
    });
  }

  Widget storeTab(BuildContext context) {
    // will pick it up from here
    // am to start another template
    List<Product> foods = [
      Product(
          name: "White",
          image: "images/3.png",
          price: "\$25.00",
          userLiked: true,
          // discount: 10
          ),
      Product(

          name: "Black",
          image: "images/5.png",
          price: "\$150.00",
          userLiked: false,
          // discount: 7.8
          ),
      Product(
        name: "Red",
        image: 'images/2.png',
        price: '\$10.99',
        userLiked: false,
      ),
      Product(
          name: "Green",
          image: "images/1.png",
          price: '\$50.00',
          userLiked: true,
          // discount: 14
          ),
          
    ];

    
    return ListView(children: <Widget>[
      headerTopCategories(),
      deals('Kind of fabrics', onViewMore: () {}, items: <Widget>[
        foodItem(foods[0], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[0],
                );
              },
            ),
          );
        }, onLike: () {}),
        foodItem(foods[1], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[1],
                );
              },
            ),
          );
        }, imgWidth: 250, onLike: () {}),
        foodItem(foods[2], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[2],
                );
              },
            ),
          );
        }, imgWidth: 200, onLike: () {}),
        foodItem(foods[3], onTapped: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return new ProductPage(
                  productData: foods[3],
                );
              },
            ),
          );
        }, onLike: () {}),
      ]
      ),
            headerNotes(),

    ]);
  }

  Widget sectionHeader(String headerTitle, {onViewMore}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, top: 10),
          child: Text(headerTitle, style: h4),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, top: 2),
          child: TextButton(
            onPressed: onViewMore,
            child: Text('View all ›', style: contrastText),
          ),
        )
      ],
    );
  }

// wrap the horizontal listview inside a sizedBox..
  Widget headerTopCategories() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(' Add Your Design', onViewMore: () {}),
        _getHeader(),
        SizedBox(
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // children: <Widget>[
            //   headerCategoryItem('Frieds', Icons.chat, onPressed: () {}),
            //   headerCategoryItem('Fast Food', Icons.chat, onPressed: () {}),
            //   headerCategoryItem('Creamery', Icons.chat, onPressed: () {}),
            //   headerCategoryItem('Hot Drinks', Icons.chat, onPressed: () {}),
            //   headerCategoryItem('Vegetables', Icons.chat, onPressed: () {}),
            // ],
          ),
        )
      ],
    );
  }

  Widget headerNotes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        sectionHeader(' Add Your Notes', onViewMore: () {}),
        // _getHeader(),
        SizedBox(
          height: 30,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        )
      ],
    );
  }

  Widget headerCategoryItem(String name, IconData icon, {onPressed}) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 10),
              width: 86,
              height: 86,
              child: FloatingActionButton(
                shape: CircleBorder(),
                heroTag: name,
                onPressed: onPressed,
                backgroundColor: Colors.white,
                child: Icon(icon, size: 35, color: Colors.black87),
              )),
          Text(name + ' ›', style: categoryText)
        ],
      ),
    );
  }

  Widget deals(String dealTitle, {onViewMore, List<Widget> items}) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          sectionHeader(dealTitle, onViewMore: onViewMore),
          SizedBox(
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: (items != null)
                  ? items
                  : <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        child: Text('No items available at this moment.',
                            style: taglineText),
                      )
                    ],
            ),
          )
        ],
      ),
    );
  }
}

//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/commons/common.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/user.dart';
import 'package:grocery/provider/app.dart';
import 'package:grocery/provider/user_provider.dart';
import 'package:grocery/widgets/custom_text.dart';
import 'package:grocery/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'cart.dart';

class ProfilePage extends StatefulWidget {
  UserModel user;

  ProfilePage({Key key, this.user}) : super(key: key);

  // final product_detail_name;
  // final product_detail_new_price;
  // final product_detail_old_price;
  // final product_detail_picture;
  //
  // ProductDetails(
  //     {this.product_detail_name,
  //     this.product_detail_new_price,
  //     this.product_detail_old_price,
  //     this.product_detail_picture});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _key = GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _phonecontrol = TextEditingController();
  String _phone = "";
  String _name = "";

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      body: Center(
        child: Container(
          color: green,
          child: ListView(
            children: <Widget>[
              Positioned(
                top: 120,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      print("CLICKED");
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(35))),
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: white,
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            userProvider.userModel.name,
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.w300,
                                fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            userProvider.userModel.email,
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                              userProvider.userModel.phone==0? "NO Phone": userProvider.userModel.phone.toString(),
                            style: TextStyle(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )),
              // Padding(
              //   padding: const EdgeInsets.only(left: 100,right: 100),
              //   child: TextButton(
              //       onPressed: () {
              //         userProvider.signOut();
              //       },
              //       style: ButtonStyle(backgroundColor: MaterialStateProperty.all(white)),
              //       child: ListTile(
              //         title: Text(
              //           "Logout out",
              //           style: TextStyle(color: green),
              //         ),
              //         trailing: Icon(
              //           Icons.exit_to_app,
              //           color: green,
              //           size: 20,
              //         ),
              //       )),
              // )
              Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.2),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: ListTile(
                        title: TextFormField(
                          controller: _phonecontrol,
                          decoration: const InputDecoration(
                              hintText: "Phone",
                              icon: Icon(Icons.phone),
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "The phone field cannot be empty";
                            } else if (value.length < 10) {
                              return "The phone has to be at least 10 characters long";
                            }
                            return null;
                          },
                        ),
                        // trailing: IconButton(
                        //     onPressed: () async{
                        //       if (_formkey.currentState.validate()){
                        //         await userProvider.add_phone(int.parse(_phonecontrol.text));
                        //       }
                        //       userProvider.reloadUserModel();
                        //       appProvider.changeIsLoading();
                        //     },
                        //     icon: Icon(
                        //       Icons.add,
                        //       size: 40,
                        //       color: white,
                        //     )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

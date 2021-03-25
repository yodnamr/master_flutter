import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_stock/src/models/product_response.dart';
import 'package:my_stock/src/services/network.dart';

class ManagementPage extends StatefulWidget {
  @override
  _ManagementPageState createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  File _image;
  final picker = ImagePicker();

  final _form = GlobalKey<FormState>();

  bool _editMode;
  ProductResponse _product;

  @override
  void initState() {
    _editMode = false;
    _product = ProductResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                _buildNameInput(),
                SizedBox(height: 12.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: _buildPriceInput(),
                      flex: 1,
                    ),
                    SizedBox(width: 12.0),
                    Flexible(
                      child: _buildStockInput(),
                      flex: 1,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration inputStyle({String label}) => InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        labelText: label,
      );

  TextFormField _buildNameInput() => TextFormField(
        decoration: inputStyle(label: "name"),
        onSaved: (String value) {
          _product.name = value;
        },
      );

  TextFormField _buildPriceInput() => TextFormField(
        decoration: inputStyle(label: "price"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _product.price = int.parse(value ?? 0);
        },
      );

  TextFormField _buildStockInput() => TextFormField(
        decoration: inputStyle(label: "stock"),
        keyboardType: TextInputType.number,
        onSaved: (String value) {
          _product.stock = int.parse(value ?? 0);
        },
      );

  AppBar _buildAppBar() => AppBar(
        centerTitle: false,
        title: Text(_editMode ? 'Edit Product' : 'Add Product'),
        actions: [
          TextButton(
            onPressed: () {
              _form.currentState.save();
              FocusScope.of(context).requestFocus(FocusNode());
              if (_editMode) {
                //todo
              } else {
                NetworkService().addProduct(null, _product);
              }
            },
            child: Text(
              'submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      );
}

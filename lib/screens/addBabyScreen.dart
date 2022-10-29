import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:baby_growth_tracker/main.dart';
import 'package:baby_growth_tracker/models/babyDAL.dart';

class AddBabyScreen extends StatefulWidget {

  @override
  _AddBabyScreenState createState() => _AddBabyScreenState();
}

class _AddBabyScreenState extends State<AddBabyScreen> {

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  var formKey=GlobalKey<FormState>();
  var tfControllerName=TextEditingController();
  var tfControllerAge=TextEditingController();
  String radioBtnValue="Kız";

  Future<void> add(String ad,int age,String gender,String imgPath) async{
    await BabyDal().addBaby(ad,age,gender,imgPath);
  }

    Future<void> addwithoutimg(String ad,int age,String gender) async{
    await BabyDal().addBabyWithOutImg(ad,age,gender);
  }

  void filePicker() async {
    final XFile? selectImage= await _picker.pickImage(source: ImageSource.gallery);
    if(/*selectImage!.path.isEmpty || */selectImage==null || selectImage.path.length<=0){
      return;
      //print(selectImage.path);
    }
    else{
      image=selectImage;
    }
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bebek Ekleyin"),
        backgroundColor: Color.fromARGB(255, 80, 0, 140),
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(color: Color.fromARGB(255, 230,230,230)),
            child: Center(
              child: Column(
                children: [
                  babyImageCard(),
                  babyInfo(),
                  
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

    SizedBox babyImageCard() {
    return SizedBox(
        height: 200,
        width: 250,
        child: Card(
          color: Color.fromARGB(255, 245,245,245),
          elevation: 20,
          //color: Color.fromARGB(255, 80, 0, 140),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: [
              circleImage(),
              addPhotoButton(),
            ],
          ),
        ),
      );
  }

  Padding circleImage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: image==null ?
       Container(
        width: 100.0,
        height: 100,
        decoration: new BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Color.fromARGB(255, 160, 80, 220), width: 3.0, style: BorderStyle.solid),
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/bebek.jpg"),
          )
        ),
        //child: image!=null ? Image.file(File(image!.path)) : Text("yok"),
      )
      :
      Container(
        width: 100.0,
        height: 100,
        decoration:BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color.fromARGB(255, 160, 80, 220), width: 3.0, style: BorderStyle.solid),
          image: DecorationImage(
            fit: BoxFit.cover,
            image:FileImage(
              File(image!.path),
            ),
          ),
        ),
      ),
    );
  }

  Padding addPhotoButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            side: BorderSide(color: Color.fromARGB(255, 80, 0, 140)),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8,left: 50,right: 50),
          child: Text("Fotoğraf Ekle",style: TextStyle(color: Color.fromARGB(255, 80, 0, 140)),),
        ),
        onPressed: (){
                  
          filePicker();

        },
      ),
    );
  }

  SizedBox babyInfo() {
    return SizedBox(
      height: 475,
      width: 350,
      child: Card(
        color: Color.fromARGB(255, 245,245,245),
        elevation: 30,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          children: [
            form()
          ],
        ),
      ),
    );
  }

  Form form() {
    return Form(
            key: formKey,
            child: Column(
              children: [
                textFieldName(),
                textFieldAge(),
                Text("Cinsiyet"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  radioBtnValue=="Kız" ? Icon(Icons.female, size: 110, color: Colors.pinkAccent,) : Icon(Icons.female, size: 110, color: Colors.black45,),
                  radioBtnValue=="Erkek" ? Icon(Icons.male, size: 110, color: Colors.blueAccent,) : Icon(Icons.male, size: 110, color: Colors.black45,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Radio(
                      value: "Kız",
                      groupValue: radioBtnValue,
                      onChanged: handleRadio,
                    ),
                    Radio(
                      value: "Erkek",
                      groupValue: radioBtnValue,
                      onChanged: handleRadio,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Kız"),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("Erkek"),
                      )
                    ],
                  ),
                ),
                formAddButton(),
              ],
            ),
          );
  }

  Padding formAddButton() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 80, 0, 140),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            side: BorderSide(color: Colors.amber,width: 1),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8,bottom: 8,left: 70,right: 70),
          child: Text("Ekle",style: TextStyle(color: Colors.white),),
        ),
        onPressed: (){


          bool controlForm=formKey.currentState!.validate();
          if (controlForm) {
            print(tfControllerName.text);
            print(tfControllerAge.text);
            print(radioBtnValue);
            print("eklendi");
            setState(() {
              if (image==null || image!.path.isEmpty) {
                addwithoutimg(tfControllerName.text,int.parse(tfControllerAge.text),radioBtnValue);
                print("resim yok");
              }
              else{
                add(tfControllerName.text,int.parse(tfControllerAge.text),radioBtnValue,image!.path);
              }
              
            });

            //Navigator.push(context, MaterialPageRoute(builder: (context)=> Anasayfa()));
            //Navigator.pop(context);
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Anasayfa()),
            (Route<dynamic> route) => false,);
            //Navigator.of(context).popUntil((route) => route.isFirst);
            
          }


        },
      ),
    );
  }

  Padding textFieldAge() {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 50,right: 50),
      child: TextFormField(
        controller: tfControllerAge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.right,
        maxLength: 1,
        decoration: InputDecoration(
          hintText: "Yaş",
          labelText: "Yaş",
        ),
        validator: (tfNameInput){
          if (tfNameInput!.isEmpty) {
            return "Yaş Giriniz!";
          }
          return null;
        },
      ),
    );
  }

  Padding textFieldName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 50,right: 50),
      child: TextFormField(
        controller: tfControllerName,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.sentences,
        textAlign: TextAlign.right,
        maxLength: 10,
        decoration: InputDecoration(
          hintText: "İsim",
          labelText: "Ad",
        ),
        validator: (tfNameInput){
          if (tfNameInput!.isEmpty) {
            return "İsim Giriniz!";
          }
                      
          if (tfNameInput.length<3) {
            return "İsim Alanı En Az 3 Harf İçerebilir!";
          }

          return null;
          
        },
      ),
    );
  }
  
  void handleRadio(String? value) {
    setState(() {
      radioBtnValue=value!;
      print(value);
    });
  }
}
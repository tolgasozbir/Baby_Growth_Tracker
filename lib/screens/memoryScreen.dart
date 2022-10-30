import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:baby_growth_tracker/models/babyDAL.dart';
import 'package:baby_growth_tracker/models/memory.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({ Key? key }) : super(key: key);

  @override
  _MemoryScreenState createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {

  Duration durationTimer=Duration(milliseconds: 1000);
  bool isLoading=true;
  Future loadData() async{
    Timer(durationTimer, finishLoad);
  }

  finishLoad() async{
  return setState(() {this.isLoading=false;});    
  }

  var tfControllerMemory=TextEditingController();
  var tfControllerDate=TextEditingController();
  var tfControllerTitle=TextEditingController();
  var formKey=GlobalKey<FormState>();

  File? image;

  Future pickImage(BuildContext context) async{
    final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 0);
    if (image==null) return;
    this.image=File(image.path);
    //////////// Save ///////////
    Navigator.pop(context);
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
    BabyDal().addMemory(
      tfControllerMemory.text.toString(),
      tfControllerTitle.text.toString(),
      tfControllerDate.text.toString(), 
      this.image!.path
    );
  }

  Future<List<Memory>> getMemories() async{
    var list=await BabyDal().getAllMemories();
    for (var item in list) {
      memoryList.add(item);
    }
    return list;
  }
  List<Memory> memoryList=[];

  @override
  void initState() {
    super.initState();
    loadData();
    getMemories();
  }

  List<Color> colors=[
    const Color(0xFFFF2448),
    const Color(0xFFFF0000),
    const Color(0xFFFF7600),
    const Color(0xFFFFB300),
    const Color(0xFFFFD500),
    const Color(0xFF8CFE00),
    const Color(0xFF00E86C),
    const Color(0xFF00F4F2),
    const Color(0xFF00CCFF),
    const Color(0xFF70A2FF),
    const Color(0xFFA96CFF),
    const Color(0xFFE040FB),
  ];

  Random rnd=new Random();
  List<String> images = [
    "https://i.picsum.photos/id/826/300/200.jpg?blur=1&hmac=Z4D-rfmcLkNJCUAPg7UiBsLP1aqTAAx0AWD58BtzcoE",
    "https://i.picsum.photos/id/14/300/200.jpg?blur=1&hmac=9IyDrA8wpef6vmrZVygJTw5LIRy5bMM76pUYHXszbtA",
    "https://i.picsum.photos/id/251/300/200.jpg?blur=1&hmac=h0LSznMBl8Wh3VnkNd-bJRPBYzII_EfOg5P96ZGyZE4",
    "https://i.picsum.photos/id/554/300/200.jpg?blur=1&hmac=FXU22Uj_mxtldcDAX0wPJ_ae4QN-07tpV0WUhXlbh_w",
    "https://i.picsum.photos/id/227/300/200.jpg?blur=1&hmac=k65DLXUkbp5K_ofoQNkLP8cqQhASqM1pTQSoE0ggK20",
    "https://i.picsum.photos/id/317/300/200.jpg?blur=1&hmac=poSKnyETbR599qlP-t_fLPhqOzPAgbBShzsF4u9f7QQ",
    "https://i.picsum.photos/id/282/300/200.jpg?blur=1&hmac=V_KvrjwubVnrHZiG4s7Fr3HezbmBwUdkUjSb2KmQdFo",
    "https://i.picsum.photos/id/379/300/200.jpg?blur=1&hmac=by-qkhAB5fY2jGA6IZodSdDIR_QGwT2KnjGyqRYfW_s",
    "https://i.picsum.photos/id/643/300/200.jpg?blur=1&hmac=cjsxx86MWBGTLDjWgAJ8JSKqbZOymfgI2lxsw2PBB9I",
    "https://i.picsum.photos/id/884/300/200.jpg?blur=1&hmac=DSX7iokLgoukP1ofryIxZjxlxjdxXMWRl4D_AqjXQbA",
    "https://i.picsum.photos/id/505/300/200.jpg?blur=1&hmac=mXQUSIv2_Ix-xPPRoRRRmkb8yPl_E9ns5iD_RMTRG20",
    "https://i.picsum.photos/id/1038/300/200.jpg?blur=1&hmac=AhWn6Ck5_p-SkpFzLKvX6BJyhCJcjnGdnf2cpr3FDoc",
    "https://i.picsum.photos/id/987/300/200.jpg?blur=1&hmac=HOeA8ecRthaXEumGnWFlalxmrx3ryrKBbcsmtxUEXCA",
    "https://i.picsum.photos/id/788/300/200.jpg?blur=1&hmac=yiMoVssQBW5skZXJc6kitxWnhLAMpwk_Yvd3pspqqJ4",
    "https://i.picsum.photos/id/344/300/200.jpg?blur=1&hmac=U2QuOKW5HzSAyhmaiDox2mX9u_nUtNd1X3nHkACeT2c",
    "https://i.picsum.photos/id/426/300/200.jpg?blur=1&hmac=vJ7P2Jw8Q6UqAgsbfGoqS0Sv3h87LIE_zMdjC0yfFOw",
    "https://i.picsum.photos/id/913/300/200.jpg?blur=1&hmac=zN3jHY009VCuaDLsPNT7772G5mQf2aHZxy0SBkxqVwk",
    "https://i.picsum.photos/id/974/300/200.jpg?blur=1&hmac=PzCkrM9R0Y84zjN571AuiMJxcsZ6qRD1CwN2scAnHSU",
    ];

  
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
        return Scaffold(
          appBar: AppBar(
            title: Text("Anılarım"),
          ),
          floatingActionButton: addFloatingActionButton(context),
          body: buildBody(),
        );
      }
    );
  }

  FloatingActionButton addFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: (){
          var date = DateTime.now();
          String day="";
          String month="";
          String nameOfDay="";
          switch (date.weekday) {
            case 1: nameOfDay="Pazartesi"; break;
            case 2: nameOfDay="Salı"; break;
            case 3: nameOfDay="Çarşamba"; break;
            case 4: nameOfDay="Perşembe"; break;
            case 5: nameOfDay="Cuma"; break;
            case 6: nameOfDay="Cumartesi"; break;
            case 7: nameOfDay="Pazar"; break;
            default: date.weekday.toString();
          }
          if (date.month<=9) {
            month="0";
          }
          if (date.day<=9) {
            day="0";
          }
          tfControllerDate.text="";
          tfControllerMemory.text="";
          tfControllerTitle.text="";
          tfControllerDate.text="$day"+date.day.toString()+".$month"+date.month.toString()+"."+date.year.toString()+" "+nameOfDay;
          addMemory(context);
      },
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGrid.count(
        //TODO:
        //itemCount: isLoading ? 12 : memoryList.length,
        //staggeredTileBuilder: (index) =>index % 2 == 0 ? StaggeredTile.count(2, 2) : StaggeredTile.count(2, 1),
        crossAxisCount: 4, 
        // itemBuilder: (context,index)=> isLoading 
        // ? shimmerEffect() 
        // : content(index),
        children: [],
      ),
    );
  }

  Widget content(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: (){
          showMemory(index,memoryList[memoryList.length - 1 -index].id);
        },
        onLongPress: (){
        },
        child: Tooltip(
          message: memoryList[memoryList.length - 1 -index].date.toString(),
          waitDuration: Duration(seconds: 3),
          child: Stack(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                decoration: new BoxDecoration(
                  image: memoryList[memoryList.length -1 -index].image.isNotEmpty ? new DecorationImage(image: new FileImage(File(memoryList[memoryList.length -1 -index].image)),fit: BoxFit.cover) : new DecorationImage(image: new NetworkImage(images[rnd.nextInt(images.length)]),fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  border: Border.all(color: colors[index%colors.length],),
                    ),
                  ),    
              Positioned(
                bottom: 0.h,
                child: SizedBox(
                  height: 3.5.h,
                  width: 46.w,
                  child: Card(
                    color: colors[index%colors.length].withOpacity(0.65),
                    child: Center(child: Text(memoryList[memoryList.length - 1 -index].title,style: TextStyle(fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showMemory(int index,int id) {
    return showDialog(
        context: context, builder: (context){
          return AlertDialog(
            title: Center(child: Text(memoryList[memoryList.length - 1 -index].date, )),
            content: Scrollbar(
              child: Container(
                height: 100.h,
                width: 100.w,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.file(File(memoryList[memoryList.length - 1 -index].image)),
                      Text(memoryList[memoryList.length - 1 -index].title, style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold), ),
                      Text("\n"+memoryList[memoryList.length - 1 -index].memory, ),
                    ],
                  ),
                  )
                ),
              ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text("  Sil  ",style: TextStyle(fontSize: 22,color: Colors.red),),
                    onTap: (){
                      AwesomeDialog(
                        btnCancelText: "İptal",
                        btnOkText: "Sil",
                        context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.scale,
                        headerAnimationLoop: false,
                        title: 'Bir Notu Silmek Üzeresin!',
                        desc: 'Bu Notu Silmek İstediğinize Emin Misin?',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                        BabyDal().deleteMemory(id);
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
                        },
                      )..show();
                    },
                  ),
                  Text("                    "),
                  GestureDetector(
                    child: Text("Düzenle",style: TextStyle(fontSize: 22, color: Colors.black54),),
                    onTap: (){
                      tfControllerDate.text=   memoryList[memoryList.length - 1 -index].date;
                      tfControllerMemory.text= memoryList[memoryList.length - 1 -index].memory;
                      tfControllerTitle.text=  memoryList[memoryList.length - 1 -index].title;
                      updateDialog(context,id);
                    },
                  ),
                ],
              ),
            ],
          );
        }
      );
  }

  AwesomeDialog updateDialog(BuildContext context,int id){
    return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.infoReverse,
      headerAnimationLoop: false,
      body: Padding(padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Anı Duzenle",style: TextStyle(fontSize: 16),),
              Divider(),
              textFieldDate(),
              Divider(),
              textFieldTitle(),
              Divider(),
              textFieldMemoryContent(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  updateButton(context,id),
                ],
              ),
            ],
          ),
        ),
      ),
    )..show();
  }

  ElevatedButton updateButton(BuildContext context,int id) {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        bool controlForm=formKey.currentState!.validate();
        if (controlForm) {
            BabyDal().updateMemory(id, tfControllerMemory.text,tfControllerDate.text,tfControllerTitle.text);
            tfControllerMemory.text="";
            tfControllerTitle.text="";
            tfControllerDate.text="";
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
        }
      },
    );
  }

  AwesomeDialog addMemory(BuildContext context){
    return AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.infoReverse,
      headerAnimationLoop: false,
      body: Padding(padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Yeni Anı",style: TextStyle(fontSize: 16),),
              Divider(),
              textFieldDate(),
              Divider(),
              textFieldTitle(),
              Divider(),
              textFieldMemoryContent(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  saveButton(context),
                ],
              ),
            ],
          ),
        ),
      ),
    )..show();
  }

  ElevatedButton saveButton(BuildContext context) {
    return ElevatedButton(
      child: Text("Resim Seç ve Kaydet"),
      onPressed: (){
        bool controlForm=formKey.currentState!.validate();
        if (controlForm) {
            pickImage(context);
        }
      },
    );
  }

  TextFormField textFieldMemoryContent() {
    return TextFormField(
              controller: tfControllerMemory,
              validator: (tfControllerMemory){
                if (tfControllerMemory!.isEmpty || tfControllerMemory.length<10 ) {
                  return "En Az 10 Karakter İçermeli";
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              maxLength: 500,
              minLines: 2,
              maxLines: 15,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Anı",
                hintText: "Unutamadığınız Anlar.",
                border: OutlineInputBorder(),
              ),
            );
  }

  TextFormField textFieldTitle() {
    return TextFormField(
              controller: tfControllerTitle,
              validator: (tfControllerTitle){
                if (tfControllerTitle!.isEmpty || tfControllerTitle.length<3 ) {
                  return "En Az 3 Karakter İçermeli";
                }
                return null;
              },
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.words,
              maxLength: 24,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "Başlık",
                hintText: "Çizelgede Görünecek Başlık.",
                border: OutlineInputBorder(),
              ),
            );
  }

  TextFormField textFieldDate() {
    return TextFormField(
      enabled: false,
      controller: tfControllerDate,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
      labelText: "Tarih",
      border: OutlineInputBorder(),
      ),
    );
  }

  Widget shimmerEffect(){
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300, 
      highlightColor: Colors.grey.shade400,
      child: Card(), 
    );
  }


}
import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:floating_dots/floating_dots.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:baby_growth_tracker/models/babyDAL.dart';
import 'package:baby_growth_tracker/models/diary.dart';
import 'dart:math' as math;
import 'package:sizer/sizer.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class DiaryScreen extends StatefulWidget {

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {

  /////////////// VT İŞLEMLERİ ///////////////
  

  int index=0;
  List<Diary> diaryList=[];

  Future<List<Diary>> getDiaries() async{
    var list=await BabyDal().getAllDiaries();
    for (var item in list) {
      diaryList.add(item);
    }
    setState(() {});
    return diaryList;
  }

  Future<void> addDiary(String diary,String date) async{
    await BabyDal().addDiary(diary, date);
  }

  Future<void> updateDiary(int id,String diary,String date) async{
    await BabyDal().updateDiary(id, diary, date);
  }

  Future<void> delete(int id) async{
    await BabyDal().deleteDairy(id);
  }

  ////////////////////////////////////////////

  var tfControllerDate=TextEditingController();
  var tfControllerDiary=TextEditingController();
  var formKey=GlobalKey<FormState>();

  var rnd=new math.Random();
  Color particleColor =Colors.black;
  List<Color> particleColors = [
    Colors.amber,Colors.blue,Colors.grey,Colors.blueGrey,Colors.brown,Colors.cyan,Colors.deepOrange,Colors.green,
    Colors.grey,Colors.indigo,Colors.lime,Colors.orange,Colors.pink,Colors.purple,Colors.lightGreenAccent.shade400,
    Colors.red,Colors.teal,Colors.yellow,Colors.black,Colors.purple,Colors.purple.shade900,
  ];

  /*particleColor = Color.fromRGBO(
        rnd.nextInt(256),
        rnd.nextInt(256),
        rnd.nextInt(256),
        1,
      );*/

@override
  void initState() {
    super.initState();
    getDiaries();
    //addDiary("Bugün her zaman ki okula geç kaldım. Hocam içeride ders işliyordu. Girip girmemek konusunda kararsız kaldım. Sonra girmeye karar verdim. Hocam o kimleri görüyorum kimleri dedi, neredesiniz Emir Bey dedi, bende saf gibi uyuya kalmışım hocam dedim, Hocam bana bak Emir, dedi bir daha benim dersime geç gelirsen kendine başka sınıf bul dedi, çok utanmıştım, sevdiğim kızda bana bakarak güldü, geçtim yerime oturdum, bir daha geç kalmamaya karar verdim, okuldan çıktıktan sonra direk eve geldim ödevimi yaptım, erkenden uyuyup, sabah çok erken uyanıp, okula bu kez erken gitmek istiyordum.", "15 Ağustos 2021");
    //addDiary("Bugün inanılmaz bir gündü adeta yeni doğmuş gibiydim. Okulda ilk günümdü yeni arkadaşlar ile tanışmıştık. Çok eğlenmiştim. Sınıfımıza hocamız geldi. Bizi bütün sınıf ile tanıştırdı. Hepimiz birbirimizi çok iyi bilmezsekte iyi eğlenmiştik. Zaman çok hızlı geçmişti. Yarını iple çekiyordum. Şimdilik bu kadar sevgili günlüğüm", "16 Ağustos 2021");
    //addDiary("Bugün okulda yeni bir gündü. Artık heyecanımı yenmiştim, farklı arkadaşlar ile tanışıyordum, kendimi biraz aşmıştım, tenefüs zili çaldığında bir sürü arkadaşımızla dışarıya çıktık, bir sürü değişik oyunlar oynadık, tekrar derse girip tekrar zil çaldıktan sonra oyunlar oynuyorduk, ders zili çaldığında ise hemen derse girip hocayı dinliyordum ilk parmak kaldıranlardan biri oluyordum, bugünüm de çok eğlenceliydi. Şimdilik bu kadar sevgili günlük.", "17 Ağustos 2021");
    //addDiary("Bugün inanılmaz kötü bir gün geçirdim. Umarım bu bana ders olmuştur. Kardeşimin doğum günü vardı. Bütün aile bizdeydi. Doğum gününü kutladık, pastaları kestik herkes pastasını yedi güzel bir gün geçirdik. Gibi duruyordu, kardeşim ile fotoğraf makinesini paylaşamayana kadar, o çekti ben çektim, en sonunda hızla geldi, bende kenara çekildim, kafasını masaya çarptı.", "18 Ağustos 2021");
    //addDiary("Sevgili günlük, bugün okulun ilk günüydü, çok heyecanlıydım. Yeni arkadaşlar ile tanışmıştım. Annem beni bırakıp gitti okula daha sonra öğretmenim çok fazla ders anlatmıştı. Okulu ve arkadaşlarımı çok sevmiştim. Çok güzel vakit geçirmiştik. Oyun oynadık. Eve geldim, hocanın vermiş olduğu ödevleri yaptım. Yarın okula gitmek için çok heyecanlıydım.", "19 Ağustos 2021");
  }


  @override
  Widget build(BuildContext context) {


    return Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:body(context),
        );
      }
    );
  }

  Scaffold body(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Günlük"),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
        ),
        floatingActionButton: addFloatActionButton(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children:[ 
                //waveEffect(),
                waveEffectReversed(),
                Padding(
                  padding: EdgeInsets.only(top: 4.w), //16 //burayı silersen üste tam yerleşir
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 37.5.h,   //scrHeight*(37.5/100),//300
                          width: 100.w,
                          decoration: new BoxDecoration(
                            //color: Colors.black54,
                            image: new DecorationImage(image: new AssetImage("images/notebook.png"),fit: BoxFit.fill),
                          ),
                          //child: diaries(context),
                        ),
                      ),
                      diaries(context),
                      pageNumberLeft(),
                      pageNumberRight(),
                      arrowLeft(),
                      arrowRight(),
                    ],
                  ),
                ),
                //waveEffectReversed(),
                //dots(),
                CircularParticle(
                  particleColor: particleColor,
                  height: 35.h, 
                  width: 100.w, 
                  numberOfParticles: 52,
                  speedOfParticles: 1,
                  onTapAnimation: true,
                  awayRadius: 52,
                  connectDots: true,
                  isRandSize: false,
                  isRandomColor: false,
                ),
              ],
            ),
          ),
        ),
      );
  }

  FloatingActionButton addFloatActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add,),
        onPressed: (){
          tfControllerDate.text="";
          tfControllerDiary.text="";
          var date = DateTime.now();
          String day="";
          String month=".";
          switch (date.month) {
            case 1: month=" Ocak"; break;
            case 2: month=" Şubat"; break;
            case 3: month=" Mart"; break;
            case 4: month=" Nisan"; break;
            case 5: month=" Mayıs"; break;
            case 6: month=" Haziran"; break;
            case 7: month=" Temmuz"; break;
            case 8: month=" Ağustos"; break;
            case 9: month=" Eylül"; break;
            case 10: month=" Ekim"; break;
            case 11: month=" Kasım"; break;
            case 12: month=" Aralık"; break;
            default: date.month.toString();
          }
          if (date.day<=9) {
            day="0";
          }
          tfControllerDate.text="$day"+date.day.toString()+"$month "+date.year.toString();
          addNewDiary(context);
        }
      );
  }

 /* Widget dots() {
    return SizedBox(
      height: 20.h,
      width: 60.w,
      child: FloatingDotGroup(
        size: DotSize.small,
        speed: DotSpeed.mixed,
        direction: Direction.up,
        colors: [
          Colors.amber,Colors.orange,Colors.yellow,
          Colors.blue,Colors.lightBlue,Colors.cyan,
          Colors.lightGreenAccent,Colors.green,
          Colors.pink,Colors.red,Colors.purple,
        ],
        trajectory: Trajectory.random,
        opacity: 0.5,
      ),
    );
  }*/

  WaveWidget waveEffect() {
    return WaveWidget(
                config: CustomConfig(
                  blur: MaskFilter.blur(BlurStyle.normal, 2),
                  gradients: [
                    [Color(0xCC4A148C),Color(0xBBBE375F)],
                    [Color(0xAA0F47A1), Color(0x9964C5EB)],
                    [Color(0x88F76FF03), Color(0x77FFEB3B)],
                    [Color(0x66FFC107), Color(0x55E67D31)],
                  ],
                  durations: [32000,24000,15000,7500], 
                  heightPercentages: [0.24,0.28,0.32,0.36],
                ),
                size: Size(100.w, 20.w),
              );
  }

    Widget waveEffectReversed() {
    return Transform.rotate(
      angle: 180 * math.pi / 180,
      child: WaveWidget(
                  config: CustomConfig(
                    blur: MaskFilter.blur(BlurStyle.outer, 32),
                    gradients: [
                      [Color(0xCC4A148C),Color(0xBBBE375F)],
                      [Color(0xAA0F47A1), Color(0x9964C5EB)],
                      [Color(0x88F76FF03), Color(0x77FFEB3B)],
                      [Color(0x66FFC107), Color(0x55E67D31)],
                    ],
                    durations: [32000,24000,15000,7500], 
                    heightPercentages: [0.30,0.34,0.38,0.42],
                  ),
                  size: Size(100.w, 20.w),
                ),
    );
  }

  Positioned pageNumberLeft() {
    return Positioned(
                  bottom: 6.h,
                  left: 26.w,
                  child: Container(
                    width: 8.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        width: 1.2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:Text((index+1).toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                );
  }

  Positioned pageNumberRight() {
    return Positioned(
                  bottom: 6.h,
                  right: 20.w,
                  child: Container(
                    width: 8.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      border: Border.all(
                        width: 1.2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child:Text((index+2).toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                );
  }

  Widget diaries(BuildContext context) {
    return Container  (
      height: 42.5.h,//h*(40/100),//328,
      width: 100.h,
      child: Stack(
        children: [
          //page1
          Positioned(
            top: 2.h,//h*(4/100), //32,
            left: 12.w,//w*(13/100),//52,
              child: Container(
                width: 36.w,//w*(35/100),//138,
                height: 3.h,  //normalde yok
                child: Center(child: diaryList.length <= index ? Text("") : Text(diaryList[index].date,style: GoogleFonts.kalam(),)),
              )
          ),
          Positioned(
            top: 6.h,//h*(7.2/100),//58,
            left: 12.w,//w*(13/100),//52,
            child: Container(
              width: 36.w,//w*(35/100),  //138,
              height: 30.h,//h*(26/100), //210,
                child: diaryList.length <= index ? Text("") : buildtext(context,diaryList[index].date,diaryList[index].diary,diaryList[index].id),
            )
          ),
          //page2
          Positioned(
            top: 2.h,
            right: 7.w,
            child: Container(
              width: 35.w,//w/3,//138,
              height: 3.h,
              child: Center(child: diaryList.length <= (index+1) ? Text("") : Text(diaryList[index+1].date,style: GoogleFonts.kalam(),)),
            )
          ),
          Positioned(
            top: 6.h,
            right: 7.w,
            child: Container(
              width: 35.w,//w/3,//138,
              height: 30.h,//h/3.8,//210,
              child: diaryList.length <= (index+1) ? Text("") : buildtext(context,diaryList[index+1].date,diaryList[index+1].diary,diaryList[index+1].id),
            )
          ),
        ],
      ),
    );
  }

  Widget arrowLeft() {
    return Positioned(
      top: 0.h,
      left: 10.w,
      child: Container(
        height: 79.h,
        child: Transform.rotate(
          angle: 180 * math.pi / 180,
          child: IconButton(
            icon: Icon(Icons.double_arrow,size: 9.w, color: Colors.purple.shade900,),
            onPressed: (){
              if (index==0) {
                
              } else {
              var newColor = rnd.nextInt(particleColors.length);
              particleColor=particleColors[newColor];
                setState(() {index-=2;});
              }
            },
          ),
        ),
      ),
    );
  }

  Widget arrowRight() {
    return Positioned(
      top: 0.h,
      right: 5.w,
      child: Container(
        height: 79.h,
        child: IconButton(
          icon: Icon(Icons.double_arrow,size: 9.w, color: Colors.purple.shade900,),
          onPressed: (){
            index+=2;
            var newColor = rnd.nextInt(particleColors.length);
            particleColor=particleColors[newColor];
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget buildtext(BuildContext context,String date,String text,int id){
    return GestureDetector(
      child: Text(
        text,
        style: GoogleFonts.mali(),
        maxLines: 1.5.h.toInt(),      //defterdeki yazı satırı sayısı
        overflow: TextOverflow.ellipsis,
      ),
      onTap: (){
        showDialog(                                 ////////////////////Method içine al /////////// Sayfa numaralarına tıklansın o sayfaya gitsin
          context: context, builder: (context){
            return AlertDialog(
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
                          //borderSide: BorderSide(color: Colors.purple.shade900, width: 3),
                          context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.scale,
                          headerAnimationLoop: false,
                          title: 'Bir Günlük Silmek Üzeresin!',
                          desc: 'Bu Günlüğü Silmek İstediğinize Emin Misin?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                          delete(id);
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
                        tfControllerDate.text=date;
                        tfControllerDiary.text=text;
                        updateDialog(context,id,date,text);
                      },
                    ),
                  ],
                ),
              ],
              title: Center(child: Text(date, style: GoogleFonts.charm())),
              content: Scrollbar(
                child: Container(
                  height: 300,
                  width: 225,//200
                  child: SingleChildScrollView(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(text, textStyle: GoogleFonts.courgette(fontWeight: FontWeight.w500,fontSize: 20)),//18
                      ],
                      isRepeatingAnimation: false,
                      displayFullTextOnTap: true,
                    )
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }

  AwesomeDialog updateDialog(BuildContext context,int id,String date,String diaryText) {
    return AwesomeDialog(
                        btnCancelText: "İptal",
                        btnOkText: "Düzenle",
                        //borderSide: BorderSide(color: Colors.purple.shade900, width: 3),
                        context: context,
                        dialogType: DialogType.WARNING,
                        animType: AnimType.SCALE,
                        headerAnimationLoop: false,
                        title: 'Bir Günlük Sayfasını Düzenliyorsun!',
                        body: Padding(padding: const EdgeInsets.all(8),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: tfControllerDate,
                                  decoration: InputDecoration(
                                    labelText: "Tarih",
                                    hintText: "16.08.2021 - 16 Ağustos 2021",
                                    border: OutlineInputBorder(),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Divider(),
                          
                                TextFormField(
                                  controller: tfControllerDiary,
                                  validator: (tfControllerDiary){
                                    if (tfControllerDiary!.isEmpty || tfControllerDiary.length<20 ) {
                                      return "En Az 20 Karakter İçermeli";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.multiline,
                                  maxLength: 1000,
                                  minLines: 2,
                                  maxLines: 15,
                                  decoration: InputDecoration(
                                    labelText: "Günlük",
                                    hintText: "Günlük Yazınızı Buraya Yazın.",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          if (tfControllerDate.text.length<=0) {
                            tfControllerDate.text=date;
                          }
                          updateDiary(id,tfControllerDiary.text, tfControllerDate.text);
                          tfControllerDiary.text="";
                          tfControllerDate.text="";
                          Navigator.pop(context);
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
                        },
                      )..show();
  }

  AwesomeDialog addNewDiary(BuildContext context){
    return AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO_REVERSED,
      headerAnimationLoop: false,
      body: Padding(padding: const EdgeInsets.all(8),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Yeni Günlük Yazısı",style: TextStyle(fontSize: 16),),
              Divider(),
              TextFormField(
                enabled: false,
                controller: tfControllerDate,
                decoration: InputDecoration(
                  labelText: "Tarih",
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
            
              Divider(),
            
              TextFormField(
                controller: tfControllerDiary,
                validator: (tfControllerDiary){
                  if (tfControllerDiary!.isEmpty || tfControllerDiary.length<10 ) {
                    return "En Az 10 Karakter İçermeli";
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                textCapitalization: TextCapitalization.sentences,
                maxLength: 1000,
                minLines: 2,
                maxLines: 15,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Günlük",
                  hintText: "Günlük Yazınızı Buraya Yazın.",
                  border: OutlineInputBorder(),
                ),
              ),

              ElevatedButton(
                child: Text("Günlüğe Ekle"),
                onPressed: (){
                  bool controlForm=formKey.currentState!.validate();
                  if (controlForm) {
                    addDiary(tfControllerDiary.text, tfControllerDate.text);
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
                  }
                },
              ),

            ],
          ),
        ),
      ),
    )..show();
  }


}


/*
AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText('It is not enough to do your best,'),
        TyperAnimatedText('you must know what to do,'),
        TyperAnimatedText('and then do your best'),
        TyperAnimatedText('- W.Edwards Deming'),
      ]

*/

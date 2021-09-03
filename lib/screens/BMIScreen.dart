import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BMIScreen extends StatefulWidget {

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {

  double height=50;
  int weight=60;
  double result=0;
  String resultText="";
  String resultHint="";
  var tfControllerWeight=TextEditingController();
  ScrollController scroll = new ScrollController();

@override
  void initState() {
    super.initState();
    tfControllerWeight.text=weight.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          appBar: AppBar(title: Text("Vücut Kitle İndeksi Hesaplama"),),
          body: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            }, 
            child: buildBody()
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      controller: scroll,
      child: Column(
        children: [
          Image.asset("images/vki.jpg"),
          sliderCardHeight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              tfCardWeight(),
              cardBMIAgeStatus(),
            ],
          ),
          calculateButton(),
          resultCard(),
        ],
      ),
    );
  }


  Padding sliderCardHeight() {
    return Padding(
      padding: EdgeInsets.all(6.0.sp),
      child: Container(
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(10), color: Colors.purple.shade900 ),
        width: 95.w,
        height: 20.h,
        child: Padding(
          padding: EdgeInsets.all(4.0.sp),
          child: Column(
            children: [
              Text("BOY", style: TextStyle(color: Colors.white, fontSize: 14.sp)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${height.toInt()}", style: TextStyle(color: Colors.white,fontSize: 32.sp,fontWeight: FontWeight.w900)),
                  Padding(
                    padding: EdgeInsets.only(top: 12.sp),
                    child: Text("cm",style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderThemeData(
                  thumbColor: Colors.blueAccent,
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Colors.black38,
                ),
                child: Slider(
                  min: 0,
                  max: 200,
                  value: height,
                  onChanged: (double newValue) {
                    setState(() { height = newValue; });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding tfCardWeight(){
    return Padding(
      padding: EdgeInsets.all(6.0.sp),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple.shade900),
        width: 45.w,
        height: 26.h,
        child: Padding(
          padding: EdgeInsets.all(4.0.sp),
          child: Column(
            children: [
              Text("KİLO", style: TextStyle(color: Colors.white, fontSize: 14.sp),),
              Padding(
                padding: EdgeInsets.only(bottom: 12.sp),
                child: TextField(
                  controller: tfControllerWeight,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 32.sp,fontWeight: FontWeight.w900),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 14.w,
                    height: 7.h,
                    child: ElevatedButton(
                      child: Icon(Icons.add),
                      onPressed: () {
                        int value= int.parse(tfControllerWeight.text);
                        value++;
                        tfControllerWeight.text=value.toString();
                        setState(() { });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 14.w,
                    height: 7.h,
                    child: ElevatedButton(
                      child: Icon(Icons.remove),
                      onPressed: () {
                        int value= int.parse(tfControllerWeight.text);
                        if (value>0) {
                        value--;
                        tfControllerWeight.text=value.toString();
                        setState(() { });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding cardBMIAgeStatus(){
    return Padding(
      padding: EdgeInsets.all(6.0.sp),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple.shade900),
        width: 45.w,
        height: 26.h,
        child: Padding(
          padding: EdgeInsets.all(4.0.sp),
          child: Column(
            children: [
              Text("YAŞA GÖRE VKİ", style: TextStyle(color: Colors.white, fontSize: 14.sp),),
              //Divider(color: Colors.amber,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Yaş \n19-24\n25-34\n35-44\n45-54\n55-65\n65+",style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  Text("VKİ \n19-24\n20-25\n21-26\n22-27\n23-28\n24-29",style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding calculateButton(){
    return Padding(
      padding: EdgeInsets.all(1.0.sp),
      child: SizedBox(
        width: 94.w,
        height: 6.h,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.purple.shade900),
          child: Text("Hesapla",style: TextStyle(color: Colors.white, fontSize: 14.sp,fontWeight: FontWeight.w600)),
          onPressed: (){
            scroll.animateTo(scroll.position.maxScrollExtent, duration: Duration(milliseconds: 1000), curve: Curves.ease);
            double x=height.toInt()/100;
            String y=(x*x).toStringAsFixed(2);
            double z=double.parse(tfControllerWeight.text)/double.parse(y);
            result=double.parse(z.toStringAsFixed(2));
            print(result);
            if (result<=18.4) {
              resultText="ZAYIF";
              resultHint="Yeterince kiloda değilsiniz.\nBoyunuza uygun ağırlığa erişmeniz için yeterli ve dengeli beslenmelisiniz!";
            }
            else if(result<=24.9){
              resultText="NORMAL";
              resultHint="Boyunuza göre uygun kilodasınız.\nKilonuzu korumaya çalışın!";
            }
            else if(result<=29.9){
              resultText="FAZLA KİLOLU";
              resultHint="Boyunuza oranla fazla kilodasınız.\nBoyunuza uygun ağırlığa erişmeniz için yeterli ve dengeli beslenmelisiniz!";
            }
            else if(result<=34.9){
              resultText="I.DERECE OBEZ";
              resultHint="I.Sınıf Obezite.\nBu durum gerekli önlemler alınmadığı takdirde kalp-damar hastalıkları, diyabet, hipertansiyon vb. kronik hastalıklar için risk faktörü oluşturur.\nBir sağlık kuruluşuna başvurarak hekim / diyetisyen kontrolünde sağlıklı bir şekilde normal ağırlığa inmeniz sağlığınız açısından çok önemlidir.";
            }
            else if(result<=39.9){
              resultText="II. DERECE MORBİD OBEZ";
              resultHint="II.Sınıf Obezite.\nBu durum gerekli önlemler alınmadığı takdirde kalp-damar hastalıkları, diyabet, hipertansiyon vb. kronik hastalıklar için risk faktörü oluşturur.\nBir sağlık kuruluşuna başvurarak hekim / diyetisyen kontrolünde sağlıklı bir şekilde normal ağırlığa inmeniz sağlığınız açısından çok önemlidir.";
            }
            else{
              resultText="III. DERECE SÜPER OBEZ";
              resultHint="III.Sınıf Ölümcül Obezite.\nBu durumda gerekli önlemler alınmadığı takdirde sonucu ölümle sonuçlanabilir.\nCerrahi operasyon mümkün, normal ağırlığınıza inmeniz sağlığınız açısından aşırı önemlidir.";
            }
            setState(() { });
          },
        ),
      ),
    );
  }

  Widget resultCard() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 24, 12, 12),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.purple.shade900),
        width: 95.w,
        height: 85.h,
        child: result==0 ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sonuc Hesaplanmadı",style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w700),),
          ],
        ) :
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Sonucunuz",style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.w700),),
            result>=18.5 && result<=24.9 ? Text(resultText,style: TextStyle(color: Colors.lightGreenAccent.shade700, fontSize: 24.sp, fontWeight: FontWeight.w700),) : Text(resultText,style: TextStyle(color: Color(0xFFFF0000), fontSize: 24.sp, fontWeight: FontWeight.w700),),
            Text(result.toString(),style: TextStyle(color: Colors.white, fontSize: 28.sp,fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(resultHint,style: TextStyle(color: Colors.white, fontSize: 14.sp),textAlign: TextAlign.center,),
            ),
            calculateAgain(),
          ],
        )
      ),
    );
  }

  Widget calculateAgain(){
    return TextButton(
      child: Text("Tekrar Hesapla"),
      onPressed: (){
        scroll.animateTo(scroll.position.minScrollExtent, duration: Duration(milliseconds: 1000), curve: Curves.ease);
      }
    );
  }
//slider ve boy seçmeye provider ekle bakalım nasıl olcak sonuç bide sonuç ekranı yapılcak





}

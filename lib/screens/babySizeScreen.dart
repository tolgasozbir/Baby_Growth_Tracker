import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:baby_growth_tracker/models/baby.dart';
import 'package:baby_growth_tracker/models/babyDAL.dart';
import 'package:baby_growth_tracker/models/babyData.dart';
import 'package:baby_growth_tracker/providerModels/babySizeModel.dart';

class BabySizeScreen extends StatefulWidget {
  final List<Baby> babyList;  //or List<Baby> babyList=[];
  BabySizeScreen(this.babyList);

  @override
  _BabySizeScreenState createState() => _BabySizeScreenState();
}

class _BabySizeScreenState extends State<BabySizeScreen> {

  bool isVisible=false; double h=10.h;
  List<BabySize> allData=[];
  var selectedBaby;
  List<int> babyId=[];
  List<List<Data>> dataList =[];
  List<Data> d1=[Data(height: 50, weight: 3.3)];
  List<Data> d2=[Data(height: 50, weight: 3.3)];
  List<Data> d3=[Data(height: 50, weight: 3.3)];
  List<Data> d4=[Data(height: 50, weight: 3.3)];
  List<Data> d5=[Data(height: 50, weight: 3.3)];


  Future<void> getDbData() async{
    
    var liste= await BabyDal().getBabyData();
    for (var item in liste) {
      allData.add(item); 
    }

    for (var i = 0; i < allData.length; i++) {

      if (allData[i].babyId==widget.babyList[0].id) {
        print("1 ye yazıldı");
        d1.add(Data(height: allData[i].height, weight: allData[i].weight));
      }
      else if (allData[i].babyId==widget.babyList[1].id) {
        print("2 ye yazıldı");
        d2.add(Data(height: allData[i].height, weight: allData[i].weight));
      }
      else if (allData[i].babyId==widget.babyList[2].id) {
        print("3 ye yazıldı");
        d3.add(Data(height: allData[i].height, weight: allData[i].weight));
      }
      else if (allData[i].babyId==widget.babyList[3].id) {
        d4.add(Data(height: allData[i].height, weight: allData[i].weight));
      }
      else if (allData[i].babyId==widget.babyList[4].id) {
        d4.add(Data(height: allData[i].height, weight: allData[i].weight));
      }
      else{return;}
    }

  setState(() {});

  }

  Future<List<BabySize>> getChartValues() async{
    var list=await BabyDal().getBabyData();
    return list;
  }

  late TooltipBehavior tooltip;
  late ZoomPanBehavior zoom;

  List<List<Data>> chartValues=[];

  List<Color> colors=[
    Color(0xFF0000FF),
    Colors.amber,
    Colors.purple,
    Color(0xFF964B00),
    Color(0xFF00FF00),
    Color(0xFFFF0000),
    Colors.cyan,
    Colors.lime,
  ];

  @override
  void initState() {
    super.initState();
    getDbData();
    getChartValues();  //for view list for delete;
    
    lineData.add(chartDataProperty("Normal", Colors.lightBlue, normalValues,));//first Data  0-6.5 yaş

      dataList.add(d1);
      dataList.add(d2);
      dataList.add(d3);
      dataList.add(d4);
      dataList.add(d5);

    for (var i = 0; i < widget.babyList.length; i++) {
      lineData.add(chartDataProperty(widget.babyList[i].name.toString(),colors[i],dataList[i]));
    }
    tooltip=TooltipBehavior(enable: true);
    zoom=ZoomPanBehavior(
      enablePinching: true, 
      enableDoubleTapZooming: true, 
      enableMouseWheelZooming: true,
      zoomMode: ZoomMode.xy,  //x eski
      enablePanning: true,
    );

  }

  @override
  Widget build(BuildContext context) {
      return Sizer(builder: (context, orientation, deviceType){
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>BabySizeModel()),
          ],
          child: Scaffold(
            appBar: AppBar(
              title: Text("Boy ve Kilo"),
            ),
            body: GestureDetector(
              child: lineData.length==0 || lineData.isEmpty ? buildBody0() : lineData.length==1 ? buildBody1() : lineData.length==2 ? buildBody2() : lineData.length==3 ? buildBody3() : lineData.length==4 ? buildBody4() : buildBody5(),
              onTap: (){
                FocusScope.of(context).unfocus();
              },
            ),
          ),
        );
      }
    );
  }

  List<Data> normalValues =[
    Data(height: 50, weight: 3.3),
    Data(height: 65.5, weight: 7.6),
    Data(height: 74.6, weight: 10),
    Data(height: 80.5, weight: 11.2),
    Data(height: 86.8, weight: 12.4),
    Data(height: 90.7, weight: 13.3),
    Data(height: 95.4, weight: 14.4),
    Data(height: 98.8, weight: 15.2),
    Data(height: 102.5, weight: 16.5),
    Data(height: 105.7, weight: 17.4),
    Data(height: 109.1, weight: 18.5),
    Data(height: 112, weight: 19.5),
    Data(height: 115.6, weight: 20.6),
    Data(height: 118, weight: 21.5),
  ];

  Widget buildBody0() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: SfCartesianChart(
              title: ChartTitle(text: "Boy-Kilo Grafiği"),
              legend: Legend(isVisible: true),
              tooltipBehavior: tooltip,
              zoomPanBehavior: zoom,
              series: <FastLineSeries<Data,double>>[
                lineData[0],lineData[1],lineData[2],
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,labelFormat: "{value} cm"),
              primaryYAxis: NumericAxis(labelFormat: "{value} kg"),
              //primaryYAxis: CategoryAxis(title: AxisTitle(text: "Ağırlık")),
            ),
          ),
          inputs(),
        ],
      ),
    );
  }

  Widget buildBody1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: SfCartesianChart(
              title: ChartTitle(text: "Boy-Kilo Grafiği"),
              legend: Legend(isVisible: true),
              tooltipBehavior: tooltip,
              zoomPanBehavior: zoom,
              series: <FastLineSeries<Data,double>>[
                lineData[0]
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,labelFormat: "{value} cm"),
              primaryYAxis: NumericAxis(labelFormat: "{value} kg"),
              //primaryYAxis: CategoryAxis(title: AxisTitle(text: "Ağırlık")),
            ),
          ),
          inputs(),
        ],
      ),
    );
  }

  Widget buildBody2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: SfCartesianChart(
              title: ChartTitle(text: "Boy-Kilo Grafiği"),
              legend: Legend(isVisible: true),
              tooltipBehavior: tooltip,
              zoomPanBehavior: zoom,
              series: <FastLineSeries<Data,double>>[
                lineData[0],lineData[1],
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,labelFormat: "{value} cm"),
              primaryYAxis: NumericAxis(labelFormat: "{value} kg"),
              //primaryYAxis: CategoryAxis(title: AxisTitle(text: "Ağırlık")),
            ),
          ),
          inputs(),
        ],
      ),
    );
  }

  Widget buildBody3() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: SfCartesianChart(
              title: ChartTitle(text: "Boy-Kilo Grafiği"),
              legend: Legend(isVisible: true),
              tooltipBehavior: tooltip,
              zoomPanBehavior: zoom,
              series: <FastLineSeries<Data,double>>[
                lineData[0],lineData[1],lineData[2],
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,labelFormat: "{value} cm"),
              primaryYAxis: NumericAxis(labelFormat: "{value} kg"),
              //primaryYAxis: CategoryAxis(title: AxisTitle(text: "Ağırlık")),
            ),
          ),
          inputs(),
        ],
      ),
    );
  }

  Widget buildBody4() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: SfCartesianChart(
              title: ChartTitle(text: "Boy-Kilo Grafiği"),
              legend: Legend(isVisible: true),
              tooltipBehavior: tooltip,
              zoomPanBehavior: zoom,
              series: <FastLineSeries<Data,double>>[
                lineData[0],lineData[1],lineData[2],lineData[3],
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,labelFormat: "{value} cm"),
              primaryYAxis: NumericAxis(labelFormat: "{value} kg"),
              //primaryYAxis: CategoryAxis(title: AxisTitle(text: "Ağırlık")),
            ),
          ),
              inputs(),
        ],
      ),
    );
  }

  Widget buildBody5() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 75.h,
            child: SfCartesianChart(
              title: ChartTitle(text: "Boy-Kilo Grafiği"),
              legend: Legend(isVisible: true),
              tooltipBehavior: tooltip,
              zoomPanBehavior: zoom,
              series: <FastLineSeries<Data,double>>[
                lineData[0],lineData[1],lineData[2],lineData[3],lineData[4]
              ],
              primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,labelFormat: "{value} cm"),
              primaryYAxis: NumericAxis(labelFormat: "{value} kg"),
              //primaryYAxis: CategoryAxis(title: AxisTitle(text: "Ağırlık")),
            ),
          ),
              inputs(),
        ],
      ),
    );
  }

  Column inputs() {
    return Column(
      children: [
        Divider(thickness: 8,),
        Text("Kilo ve Boy Ekle",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        const Divider(),
        dropDownBabyList(),
        const Divider(),
        _buildHeightCalculator(context),
        _buildTextWidgetPointer(context),
        const Divider(),
        saveButton2(context),
        Divider(thickness: 8,),
        Text("VEYA",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
        const Divider(),
        textFieldWeight(),
        textFieldHeight(),
        saveButton(context),
        Center(child: Text(checkValues),),
        Divider(),
        showHideDataButton(),
        SizedBox(width: 95.w,height: h, child: showData(context)),
      ],
    );
  }
  
  double _pointerValue = 130;
  double minimumLevel = 0;
  double maximumLevel = 200;

  //////////////////////////  with provider //////////////////////////////////
  Widget _buildHeightCalculator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          height: 75.h,
          padding: const EdgeInsets.all(5.0),
          child: Consumer<BabySizeModel>(                               //  
            builder: (context,obj,child){ return SfLinearGauge(         //  here
            orientation: LinearGaugeOrientation.vertical,
            minimum: 0,
            maximum: maximumLevel,
            tickPosition: LinearElementPosition.outside,
            labelPosition: LinearLabelPosition.outside,
            minorTicksPerInterval: 0,
            interval: 25,
            onGenerateLabels: () {
              return <LinearAxisLabel>[
                const LinearAxisLabel(text: '0 cm', value: 0),
                const LinearAxisLabel(text: '25 cm', value: 25),
                const LinearAxisLabel(text: '50 cm', value: 50),
                const LinearAxisLabel(text: '75 cm', value: 75),
                const LinearAxisLabel(text: '100 cm', value: 100),
                const LinearAxisLabel(text: '125 cm', value: 125),
                const LinearAxisLabel(text: '150 cm', value: 150),
                const LinearAxisLabel(text: '175 cm', value: 175),
                const LinearAxisLabel(text: '200 cm', value: 200),
              ];
            },
            axisTrackStyle: const LinearAxisTrackStyle(thickness: 5.0),
            markerPointers: <LinearMarkerPointer>[
              LinearShapePointer(
                  value: obj.pointerValue,
                  enableAnimation: false,
                  onChanged: (dynamic value) {
                    obj.updatePointer(value);
                  },
                  position: LinearElementPosition.outside,
                  shapeType: LinearShapePointerType.rectangle,
                  color: const Color(0xff0074E3),
                  height: 0.2.h,
                  width: 60.w),
              LinearWidgetPointer(
                value: obj.pointerValue,
                enableAnimation: false,
                position: LinearElementPosition.cross,
                  onChanged: (dynamic value) {
                    obj.updatePointer(value);
                    _pointerValue=obj.pointerValue;         //ana değişken
                  },
                child: Container(
                  width: 6.w,
                  height: 4.h,
                  child: Image.asset(
                    'images/slider_pointer.png',
                  ),
                ),
              ),
              LinearWidgetPointer(
                value: obj.pointerValue,
                markerAlignment: LinearMarkerAlignment.center,
                enableAnimation: false,
                  onChanged: (dynamic value) {
                    obj.updatePointer(value);
                  },
                offset: 56.w,
                position: LinearElementPosition.outside,
                child: Container(
                  width: 60,
                  height: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white70,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black54,
                        offset: const Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Consumer<BabySizeModel>(
                      builder: (context,babySizeModelObject,child){
                        return Text("${babySizeModelObject.pointerValue.toStringAsFixed(0)} cm"/*_pointerValue.toStringAsFixed(0) + ' cm'*/,style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Color(0xff0074E3)));
                      },
                    ),
                  ),
                ),
              ),
            ],
            ranges: <LinearGaugeRange>[
              LinearGaugeRange(
                endValue: obj.pointerValue,
                startWidth: 200,
                midWidth: 300,
                endWidth: 200,
                color: Colors.transparent,
                child: Image.asset(
                  'images/human_body.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          );
            }
          )
        ),
      ),
    );
  }
  
  double _textWidgetPointerValue = 40;
  //////////////////////////  with provider //////////////////////////////////
  Widget _buildTextWidgetPointer(BuildContext context) {
    return Container(
    height:  16.h,
    child: Consumer<BabySizeModel>(
      builder: (context,obj,child){
        return SfLinearGauge(
          animateAxis: true,
          axisTrackStyle: const LinearAxisTrackStyle(thickness: 24),
          orientation: LinearGaugeOrientation.horizontal,
          markerPointers: <LinearMarkerPointer>[
            LinearWidgetPointer(
              value: obj.textWidgetPointerValue,
              onChanged: (dynamic value) {
                obj.updateTextWidgetPointerValue(value);
                _textWidgetPointerValue=value;            //here
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xff06589C),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  shape: BoxShape.circle
                ),
                child: Center(
                  child: Text(obj.textWidgetPointerValue.toStringAsFixed(0) + " kg",
                  style: TextStyle(fontWeight: FontWeight.bold,color: const Color(0xFFFFFFFF),
                )))),
            )
          ]);
        },
      )
    );
  }

  FastLineSeries<Data, double> chartDataProperty(String babyName,Color color,List<Data> data) {
    return FastLineSeries<Data, double>(
        name: babyName,
        dataSource: data, 
        xValueMapper: (Data data, _) => data.height,
        yValueMapper: (Data data, _) => data.weight,
        //dataLabelSettings: DataLabelSettings(isVisible: true),
        enableTooltip: true,
        color: color,
        width: 3,
        markerSettings: MarkerSettings(isVisible: true,width: 12,height: 12,borderWidth: 3,),
      );
  }

  List<FastLineSeries<Data,double>> lineData= [];

  var tfControllerHeight=TextEditingController();
  var tfControllerWeight=TextEditingController();

  Widget dropDownBabyList() {
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: 30.w,
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(12)),
        child: DropdownButton<Baby>(
          hint:  Text("Çocuk Seç"),
          value: selectedBaby,
          items: widget.babyList.map((values) {
            return  DropdownMenuItem<Baby>(
              value: values,
              child: Text(values.name.toString()),
            );
          }).toList(),
          onChanged: (value) {
            selectedBaby = value!;
            selectedBabyId=selectedBaby.id;
            setState(() {  });
          },
        ),
      ),
    );
  }

  Widget textFieldHeight() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: tfControllerHeight,
        keyboardType: TextInputType.number,
        maxLength: 5,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: "Boy",
          hintText: "72",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget textFieldWeight() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: tfControllerWeight,
        keyboardType: TextInputType.number,
        maxLength: 5,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: "Kilo",
          hintText: "14",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  String checkValues="";
  int selectedBabyId=0;
  ElevatedButton saveButton(BuildContext context) {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        print(selectedBaby);
        if (selectedBaby==null || tfControllerHeight.text=="" || tfControllerHeight.text.length==0 || tfControllerHeight.text.contains(",") || tfControllerWeight.text=="" || tfControllerWeight.text.length==0 || tfControllerWeight.text.contains(",")) {
          checkValues="Alanları Lütfen Kontrol Edin!\nKüsürlü Sayılar İçin (.)'Nokta' Kullanın.!"; setState(() { });
        }
        else{
          BabyDal().addChartData(double.parse(tfControllerHeight.text), double.parse(tfControllerWeight.text), selectedBabyId);
          checkValues="";
          selectedBabyId=0;
          tfControllerHeight.text="";
          tfControllerWeight.text="";
          setState(() {  });
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
        }
      },
    );
  }

  ElevatedButton saveButton2(BuildContext context) {
    return ElevatedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if (selectedBaby==null) {
          checkValues="Lütfen Çocuk Seçin"; setState(() { });
        }
        else{
          double height=double.parse( _pointerValue.toStringAsFixed(0));
          double weight=double.parse( _textWidgetPointerValue.toStringAsFixed(0));
          BabyDal().addChartData(height, weight, selectedBabyId);
          checkValues="";
          selectedBabyId=0;
          tfControllerHeight.text="";
          tfControllerWeight.text="";
          setState(() {  });
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));
        }
      },
    );
  }

  Widget showHideDataButton(){
    return ElevatedButton(
      child: Text("Kayıtlı Verileri Göster"),
      onPressed: (){
        isVisible=!isVisible;
        if (isVisible) {
          h=50.h;
        }
        else{h=10.h;}
        setState(() {
          
        });
      },
    );
  }

  Widget showData(BuildContext context){
    return FutureBuilder<List<BabySize>>(
      future: getChartValues(),
      builder: (context,snapshot){
        if (snapshot.hasData) {
          var dataList=snapshot.data;
          return ListView.builder(
            itemCount: dataList!.length,
            itemBuilder: (context,index){
              return Visibility(
                visible: isVisible,
                child: Card(
                  color: Colors.amber,
                  child: ListTile(
                    leading: Text(dataList[index].baby.name),
                    title: Text("Boy  "+dataList[index].height.toString()+"   -   Kilo  "+dataList[index].weight.toString()),
                    subtitle: Text("${index+1}. sıradaki kayıt"),
                    enabled: true,
                    trailing: GestureDetector(
                      onTap: (){
                        BabyDal().deleteChartData(dataList[index].id);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Grafiğin güncellenmesi için sayfayı yeniden yükleyin")));
                        setState(() {
                          
                        });
                      },
                      child: Icon(Icons.delete)
                    ),
                  ),
                ),
              );
            },
          );
        }
        else{
          return Center(child: Text("Veri Bulunamadı."),);
        }
      },
    );
  }

}

class Data{
  final double height;
  final double weight;
  Data({required this.height,required this.weight});
}
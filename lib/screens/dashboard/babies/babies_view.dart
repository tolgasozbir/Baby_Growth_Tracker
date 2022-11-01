import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/routes/app_router.dart';
import 'package:baby_growth_tracker/utilities/user_records.dart';
import 'package:flutter/material.dart';
import '../../../widgets/baby_card.dart';

class BabiesView extends StatefulWidget {
  const BabiesView({Key? key}) : super(key: key);

  @override
  State<BabiesView> createState() => _BabiesViewState();
}

class _BabiesViewState extends State<BabiesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.router.push(AddBabyRoute());
        },
        child: Icon(Icons.add,),
      ),
      body: _bodyView(),
    );
  }

  Widget _bodyView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: UserRecords.instance.babyList.map((e) => BabyCard(baby: e,)).toList(),
      ),
    );
  }
}
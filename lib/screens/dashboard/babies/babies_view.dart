import 'package:auto_route/auto_route.dart';
import 'package:baby_growth_tracker/constants/app_styles.dart';
import 'package:baby_growth_tracker/providers/babies_provider.dart';
import 'package:baby_growth_tracker/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        onPressed: () => context.router.push(const AddBabyRoute()),
        child: const Icon(Icons.add,),
      ),
      body: _bodyView(),
    );
  }

  Widget _bodyView() {
    return ListView(
      padding: AppPaddings.paddingAll8,
      physics: const BouncingScrollPhysics(),
      children: context.watch<BabiesProvider>().babyList.map((e) => BabyCard(baby: e)).toList(),
    );
  }
}
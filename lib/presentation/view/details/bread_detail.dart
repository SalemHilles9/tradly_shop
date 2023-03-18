import 'package:flutter/material.dart';
import '../custom_widgets/custom_back_app_bar.dart';

class BreadDetail extends StatefulWidget {
  const BreadDetail({Key? key}) : super(key: key);

  @override
  _BreadDetailState createState() => _BreadDetailState();
}

class _BreadDetailState extends State<BreadDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(text: 'Bread & Bakery',),
    );
  }
}

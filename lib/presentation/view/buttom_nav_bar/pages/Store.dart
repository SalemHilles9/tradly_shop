import 'package:flutter/material.dart';
import 'package:tradly_shope/core/constances.dart';
import '../../custom_widgets/custom_app_bar.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: BackgroundColor,
        appBar: CustomAppBar(
          text: 'My Store',
        ),
        body: ListView(
          children: [
            Image.asset('assets/images/store.png'),
            Center(
              child: Text(
                'You Dont Have a Store',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: _mediaQuery.height * 0.05,
            ),
            MaterialButton(
              onPressed: () {},
              child: Container(
                width: _mediaQuery.width * 0.58,
                height: _mediaQuery.height * 0.06,
                decoration: BoxDecoration(
                  color: MainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text('Create Store',
                    style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

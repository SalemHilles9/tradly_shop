import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constances.dart';
import '../../custom_widgets/custom_app_bar.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: BackgroundColor,
        appBar: CustomAppBar(
          text: 'Order History',
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    'Transactions',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  width: _mediaQuery.width * 0.3,
                  height: _mediaQuery.height * 0.03,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      'March 2023',
                      style: TextStyle(
                          color: MainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            OrderContainer(isBorder: true,bText: 'Delivered',),
            OrderContainer(bText: 'Order placed',),
            OrderContainer(bText: 'Payment confirmed',),
            OrderContainer(bText: 'Processed',),
          ],
        ));
  }
}

class OrderContainer extends StatelessWidget {
  OrderContainer({Key? key, this.bText, this.isBorder}) : super(key: key);
  String? bText;
  bool? isBorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/vegetables.jpg',),fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // child: Image.asset(
                    //   'assets/images/vegetables.jpg',
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coca Cola",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$15",
                            style: TextStyle(
                                color: MainColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 5
                          ),
                          Text('50\% off')
                        ],
                      )
                    ],
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  decoration: isBorder == true
                      ? BoxDecoration(
                          color: MainColor,
                          borderRadius: BorderRadius.circular(30),
                        )
                      : BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: MainColor,
                            width: 1.5,
                          ),
                        ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: Center(
                      child: Text(
                        bText!,
                        style: TextStyle(
                            color: isBorder == true ? Colors.white : MainColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

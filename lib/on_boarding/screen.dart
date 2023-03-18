import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tradly_shope/on_boarding/const.dart';
import 'package:tradly_shope/on_boarding/controller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardignController>(
        init: OnBoardignController(),
        builder: (controller) {
          return Stack(
            children: [
              // page view .
              PageView.builder(
                itemCount: ConstList.onBoarding.length,
                onPageChanged: (value) => controller.changeIndex(value),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(ConstList.onBoarding[index].image),
                      Text(ConstList.onBoarding[index].title),
                      Text(ConstList.onBoarding[index].desc),
                    ],
                  );
                },
              ),

              // button
              InkWell(
                onTap: () => controller.skipButton(),
                child: Container(
                  width: 331,
                  height: 56,
                  color: Colors.teal,
                  child: Center(
                    child: Text("START"),
                  ),
                ),
              ),

              // indecator

              Row(
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    width: index == controller.selectIndex ? 20 : 40,
                    height: index == controller.selectIndex ? 20 : 40,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: index == controller.selectIndex
                          ? Colors.teal
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomizationCounterState extends GetxController {
  RxInt count = 0.obs;

  void decrement() {
    if (count.value > 0) {
      count.value--;
      update();
    }
  }

  void increment() {
    if (Platform.isIOS) {
      if (count.value < 2) {
        count.value++;
        update();
      }
    } else {
      if (count.value < 3) {
        count.value++;
        update();
      }
    }
  }
}

class CustomizationCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomizationCounterState controller =
        Get.put(CustomizationCounterState());

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 5, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Action Count',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),

                ///Use the decrement method of the CounterController class
                onPressed: controller.decrement,
              ),
              Obx(() => Text(
                    controller.count.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
              IconButton(
                icon: Icon(Icons.add),

                /// Use the increment method of the _CounterWidgetState class
                onPressed: controller.increment,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

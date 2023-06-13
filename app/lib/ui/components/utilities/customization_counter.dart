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

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ExcludeSemantics(
                child: Text(
                  'Action Count',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Row(
              children: [
                MergeSemantics(
                  child: Row(
                    children: [
                      Obx(
                        () => Semantics(
                          value:
                              '${controller.count.toString()} actions in the top app bar, click to add another one',
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: controller.decrement,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ExcludeSemantics(
                  child: Obx(() => Text(
                        controller.count.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                ),
                MergeSemantics(
                  child: Row(
                    children: [
                      Obx(
                        () => Semantics(
                          value:
                              '${controller.count.toString()} action in the top app bar, click to add one',
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: controller.increment,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

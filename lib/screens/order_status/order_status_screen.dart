import 'package:bakery_app/constants/app_colors.dart';
import 'package:bakery_app/constants/constants.dart';
import 'package:bakery_app/models/ordered_item_model.dart';
import 'package:bakery_app/screens/order_status/order_status_controller.dart';
import 'package:bakery_app/widgets/Pop-Ups/filter_button.dart';
import 'package:bakery_app/widgets/ordered_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderStatusScreen extends StatelessWidget {
  OrderStatusController controller = Get.find<OrderStatusController>(
      tag: ControllerTags.orderStatusController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  AppConstants.myOrders,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  child: FloatingActionButton(
                    onPressed: () {
                      FilterButton.FilterBox(context);
                    },
                    backgroundColor: AppColors.primary1,
                    child: const Icon(Icons.filter_alt_outlined),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.filteredOrders.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.toNamed(RouteConstants.orderInformationScreen);
                    },
                    child: OrderedItemCard(
                        order: controller.filteredOrders[index]),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

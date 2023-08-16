import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_layout.dart';
import 'package:sahlah/app_layout/layout_view.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/modules/checkout/add_card_view.dart';
import 'package:sahlah/modules/checkout/done_order.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';
import 'package:sahlah/shared/widgets/custom_widgets.dart';
import 'package:sahlah/shared/widgets/custom_widgets/appbar_screens.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String? valueG = 'debit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBarScreens(
          title: 'Checkout',
          onPressed: () {
            maybePop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.only(
            left: 26,
            right: 30,
            top: 15,
          ),
          children: [
            Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            15.height,
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.green,
                      ),
                      10.width,
                      const Text(
                        'Amman',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      10.width,
                      const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Text(
                      'Elgalaa street - First, second section, Assiut Behind the events house'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            15.height,
            Text(
              'Promo Code?',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            15.height,
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter Your Promo',
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    height: 46,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(16),
                                topRight: Radius.circular(16)),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Add',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            15.height,
            Text(
              'Pay With',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            15.height,
            RadioListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.card_giftcard,
                    color: Colors.blue,
                  ),
                  15.width,
                  Text("Debit / Credit Card"),
                ],
              ),
              value: "debit",
              groupValue: valueG,
              onChanged: (value) {
                setState(() {
                  valueG = value;
                });
              },
            ),
            RadioListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.money,
                    color: Colors.green,
                  ),
                  15.width,
                  Text("Cash On Delivery"),
                ],
              ),
              value: "cash",
              groupValue: valueG,
              onChanged: (value) {
                setState(() {
                  valueG = value;
                });
              },
            ),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(12),
              padding: const EdgeInsets.all(6),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffF5F5F5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Item total:',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            '${AppCubit.get(context).totalPrice} EGP',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Delivery fees:',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text('${AppCubit.get(context).delivery} EGP',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                      10.height,
                      Divider(),
                      10.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          Text('${AppCubit.get(context).total} EGP',
                              style: TextStyle(
                                color: Color(0xff23AA49),
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.height,
            defaultElevatedButton(
              backGroundColor: Color(0xff23AA49),
              text: 'Checkout',
              height: 50,
              width: 300,
              borderRadius: 16,
              fontSize: 16,
              function: (){
                if (valueG == 'debit') {
                  navigateTo(context, AddCardScreen());
                } else {
                  for (int index = 0 ; index < myCartList.length; index++){
                    AppCubit.get(context).addToMyHistory(index: index);
                  }
                  myCartList.clear();
                  navigateToAndRemoveUntil(context, DoneOrder());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

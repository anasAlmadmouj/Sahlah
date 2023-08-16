import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_cubit/app_state.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/my_cart_model.dart';
import 'package:sahlah/modules/checkout/checkout_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';import 'package:sahlah/shared/widgets/custom_widgets.dart';
class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
      return
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(60),
        //   child: AppBarScreens(
        //     title: 'My Cart',
        //     onPressed: () {
        //       pop(context);
        //     },
        //   ),
        // ),
         myCartList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage(ImageAssets.cartEmpty)),
                    20.height,
                    Text(
                      'Cart Empty',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                    ),
                    20.height,
                    Text(
                      'You dont have any foods in cart at this time',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            onDismissed: (item) {
                              AppCubit.get(context)
                                  .removeFromMyCart(index: index , price: myCartList[index].price , number: myCartList[index].numberItem);
                              // Scaffold.of(context)
                              //     .showSnackBar(SnackBar(content: Text("$item dismissed")));
                            },
                            background: Container(
                              alignment: Alignment.centerRight,
                              color: Color(0xffFEAD1D),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                            child: Container(
                              height: 100,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 60,
                                    backgroundImage:
                                        AssetImage(myCartList[index].image),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        myCartList[index].name,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(myCartList[index].restaurant),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${myCartList[index].price}',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Text(
                                            'Jd',
                                            style: TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        color: const Color(0xffF7F7F7),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                AppCubit.get(context)
                                                    .counterMinusMyCart(
                                                  index: index,
                                                  myCart: MyCart(
                                                    name:
                                                    myCartList[index].name,
                                                    restaurant:
                                                    myCartList[index]
                                                        .restaurant,
                                                    image:
                                                    myCartList[index].image,
                                                    price:
                                                    myCartList[index].price,
                                                    numberItem:
                                                    myCartList[index]
                                                        .numberItem,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xffE3F3EB),
                                                ),
                                                alignment: Alignment.center,
                                                width: 40,
                                                height: 25,
                                                child: const Icon(
                                                  Icons.remove_outlined,
                                                  color: Color(0xff53E88B),
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                '${myCartList[index].numberItem}'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                AppCubit.get(context)
                                                    .counterPlusMyCart(
                                                  index: index,
                                                  myCart: MyCart(
                                                    name:
                                                        myCartList[index].name,
                                                    restaurant:
                                                        myCartList[index]
                                                            .restaurant,
                                                    image:
                                                        myCartList[index].image,
                                                    price:
                                                        myCartList[index].price,
                                                    numberItem:
                                                        myCartList[index]
                                                            .numberItem,
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xff23AA49),
                                                ),
                                                width: 40,
                                                height: 25,
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: myCartList.length,
                      ),
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      padding: const EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xffF5F5F5),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Total:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text(
                                      '${AppCubit.get(context).total} EGP',
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
                        navigateToAndRemoveUntil(context, CheckoutView());
                      }
                    ),
                  ],
                ),
              );

    });
  }
}

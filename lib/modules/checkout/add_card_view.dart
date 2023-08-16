import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sahlah/app_layout/app_cubit/app_cubit.dart';
import 'package:sahlah/app_layout/app_layout.dart';
import 'package:sahlah/constant/image_assets/image_assets.dart';
import 'package:sahlah/main.dart';
import 'package:sahlah/models/my_cart_model.dart';
import 'package:sahlah/modules/checkout/done_order.dart';
import 'package:sahlah/modules/home_view/home_view.dart';
import 'package:sahlah/shared/local_storage/navigator_helper.dart';

class AddCardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCardScreenState();
  }
}

class AddCardScreenState extends State<AddCardScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = true;
  OutlineInputBorder? border;
  bool isFast = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context, state){
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  CreditCardWidget(
                    glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Shopping Card',
                    frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                    backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.grey) : null,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: const Color(0xff5BE07A),
                    backgroundImage:
                    useBackgroundImage ? ImageAssets.creditImage : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          ImageAssets.master,
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: cardHolderName,
                            expiryDate: expiryDate,
                            themeColor: Colors.blue,
                            textColor: Colors.black,
                            cardHolderDecoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              // focusedBorder: border,
                              // enabledBorder: border,
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Card Holder',
                            ),
                            cardNumberDecoration: const InputDecoration(
                              labelText: 'Card Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              // focusedBorder: border,
                              // enabledBorder: border,
                            ),
                            expiryDateDecoration: const InputDecoration(
                              prefixIcon: Icon(Icons.date_range_outlined),
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              // focusedBorder: border,
                              // enabledBorder: border,
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                            ),
                            cvvCodeDecoration: const InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintStyle: TextStyle(color: Colors.black),
                              labelStyle: TextStyle(color: Colors.black),
                              // focusedBorder: border,
                              // enabledBorder: border,
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(ImageAssets.google),
                              ),
                              25.width,
                              Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(ImageAssets.facebook),
                              ),
                              25.width,
                              Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.asset(ImageAssets.twitter),
                              ),
                            ],
                          ),
                          25.height,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0 , right: 16),
                            child: Row(
                              children: [
                                Expanded(child: Text('For faster and more secure checkout \n save your card details.',style: TextStyle(color: Color(0xff595959)),)),
                                Switch(
                                    value: isFast,
                                    activeColor: Colors.white,
                                    activeTrackColor: Colors.green,
                                    onChanged: (val){
                                  setState(() {
                                    isFast = val;
                                  });
                                }
                                ),

                              ],
                            ),
                          ),
                          const SizedBox(height: 30,),

                          GestureDetector(
                            onTap: _onValidate,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: <Color>[
                                    Colors.green,
                                    Colors.green,
                                    Colors.green,
                                    Colors.green,
                                    Colors.green,
                                    Colors.green,
                                    Colors.green,
                                    Colors.green
                                  ],
                                  begin: Alignment(-1, -4),
                                  end: Alignment(1, 4),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                'Confirm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );

  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      for (int index = 0 ; index < myCartList.length; index++){
        AppCubit.get(context).addToMyHistory(index: index);
      }
      myCartList.clear();
      navigateTo(context, DoneOrder());
    } else {
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:banking_app/data_json/card_json.dart';
import 'package:banking_app/data_json/card_options_json.dart';
import 'package:banking_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

// -------------------------getAppBar appbar of the card page --------------------------------
  Widget getAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 22,
            color: black,
          )),
      title: const Text(
        "Card",
        style: TextStyle(
          fontSize: 18,
          color: black,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: black,
              size: 25,
            ))
      ],
    );
  }
//-----------------getBody card page body -----------------------

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    final pageController = PageController();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            child: PageView(
              controller: pageController,
              children: List.generate(
                cardLists.length,
                (index) => getCard(
                  cardLists[index]["amount"],
                  cardLists[index]["currency"],
                  cardLists[index]["card_number"],
                  cardLists[index]["valid_date"],
                  cardLists[index]["bg_color"],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                  )
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: size.width / 2,
                          height: 55,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: primary,
                                width: 3.5,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Operations",
                              style: TextStyle(
                                fontSize: 15,
                                color: primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: size.width / 2,
                          height: 55,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: black.withOpacity(0.05),
                                width: 1,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "History",
                              style: TextStyle(
                                fontSize: 15,
                                color: primary.withOpacity(0.5),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(
                    cardOptions.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: secondary.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    cardOptions[index]["icon"],
                                    size: 20,
                                    color: primary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  cardOptions[index]["title"],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  //------------------getCard-----------------------

  Widget getCard(amount, currency, cardNumber, validDate, bgColor) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: black,
              ),
            ),
          ],
        ),
        //----------------------space between theamount aand the cureency and--------------------
        const SizedBox(
          height: 15,
        ),
        Container(
          width: size.width * 0.85,
          height: 170,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      AntDesign.creditcard,
                      size: 30,
                      color: white.withOpacity(0.3),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      cardNumber,
                      style: TextStyle(
                        fontSize: 20,
                        color: white.withOpacity(0.8),
                        wordSpacing: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VALID DATE",
                          style: TextStyle(
                            fontSize: 12,
                            color: white.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          validDate,
                          style: const TextStyle(
                            fontSize: 13,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/master_card.png",
                      width: 50,
                      height: 50,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

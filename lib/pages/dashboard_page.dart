// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:banking_app/data_json/balance_json.dart';
import 'package:banking_app/pages/card_page.dart';
import 'package:banking_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

//------------------Main DashBoard Page Class ---------------------------------------

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  // --------------------here is the appBar of the DashboardPage-----------------

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: primary,
      leading: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3870&q=80"),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(AntDesign.search1),
        ),
      ],
    );
  }

  //-----------------------The body of the Dashboard Page is Here------------

  Widget getBody() {
    // Medai Query to get the size of the screen with media query

    var size = MediaQuery.of(context).size;

    //-----------------main column of the page--------------------
    return Column(
      children: [
        //----------------------Main Container -------------------------

        Container(
          width: size.width,
          height: size.height * 0.25,
          decoration: const BoxDecoration(color: primary),
          //--------------------------- Upper Blue part of the Dashboard --------------
          child: Column(
            children: [
              // --------------------------- Showing Blance section ----------------

              Container(
                width: size.width,
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  //---------------- The List of the shhowing balance
                  child: Row(
                    // ------------------Generate the list with respect to the size of the BlacneList json data file
                    children: List.generate(balanceLists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          // ---------------Assiging the 70% width of the screen
                          width: size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // -------------Main inner section of the blacnce showing--------------
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    balanceLists[index]["currency"],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    balanceLists[index]["amount"],
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      color: index == 0
                                          ? white
                                          : white.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                              // ----------------Asigning the gap between the Balacne and the description-------------------
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                balanceLists[index]["description"],
                                style: TextStyle(
                                  fontSize: 17,
                                  color: white.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              // ----------------- Using the Expanded Widget to assign the space to divide the remaong screen of the dashboard----
              Expanded(
                  child: Container(
                width: size.width,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    // --------------Use the flexible to add the button ---------------
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Add money",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Exchange",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 25,
                  bottom: 40,
                ),
                child: getAccountSection(),
              ),
            ),
          ),
        ),
      ],
    );
  }

// ----------------------Here is the Account Section code-------------------------

  Widget getAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Account",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
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
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              AntDesign.wallet,
                              color: primary,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          "56546-876-9-7009-877678",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: primary,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          MaterialIcons.euro_symbol,
                          color: primary,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "18 199.24 EUR",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(padding: EdgeInsets.only(left: 50)),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: secondary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Icon(
                          MaterialCommunityIcons.currency_gbp,
                          size: 20,
                          color: primary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "36.67 GBP",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Cards",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 22,
              width: 90,
              decoration: BoxDecoration(
                color: secondary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Ionicons.ios_add,
                    size: 16,
                    color: primary,
                  ),
                  Text(
                    "ADD CARD",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        // -------------------------------------Cards Section--------------------
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const CardPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                AntDesign.creditcard,
                                color: primary,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "EUR *2330",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        " 8 194.24 EUR",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

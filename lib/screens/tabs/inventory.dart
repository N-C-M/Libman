import 'package:flutter/material.dart';
import 'package:libman/Components/background.dart';
import 'package:libman/constants.dart';
import 'package:libman/screens/tabs/membership.dart';
import 'package:libman/widgets/reusable_card.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 15, right: 10),
          child: Text(
            "Inventory",
            style: TextStyle(
                fontSize: size.width * .07,
                fontFamily: "RedHat",
                color: Colors.black.withOpacity(.5)),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              //SizedBox(height: 150),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    print("hi");
                  },
                  colour: activeCardColor,
                  width: size.width * .1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.logout_rounded,
                        size: 75,
                        color: kprimarycolor,
                      ),
                      Text(
                        "Issue Book",
                        style: kcardtext,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    print("hi");
                  },
                  colour: activeCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.login_rounded,
                        size: 75,
                        color: kprimarycolor,
                      ),
                      Text(
                        "Return Book",
                        style: kcardtext,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: ReusableCard(
              onTap: () {
                print("hi");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Scaffold(body: Background(child: Text("data")));
                }));
              },
              colour: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.inventory_rounded,
                    size: 75,
                    color: kprimarycolor,
                  ),
                  Text(
                    "Inventory",
                    style: kcardtext,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

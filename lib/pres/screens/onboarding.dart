import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/images.dart';
import '../widgets/clipper.dart';
import 'login.dart';

class boardingMaodel {
  late final String image;
  late final String title;

  // late final String body;
  boardingMaodel({
    required this.image,
    required this.title,
    // required this.body
  });
}

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var boardController = PageController();
  List<boardingMaodel> boarding = [
    boardingMaodel(
      image: onboard1,
      title: "Welcome in our shop",
      // body: ""
    ),
    boardingMaodel(
      image: onboard2,
      title: "Enjoy our offers",
      // body: ""
    ),
    boardingMaodel(
      image: onboard3,
      title: "Join us",
      // body: ""
    ),
  ];
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
              child: Text("SKIP"))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemCount: boarding.length,
              itemBuilder: (context, index) =>
                  onBoardingBuilder(boarding[index]),
            ),
          ),
          Row(
            children: [
              SmoothPageIndicator(
                  controller: boardController,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: Colors.blueGrey),
                  count: boarding.length),
              Spacer(),
              TextButton(
                  onPressed: () {
                    boardController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOutBack);
                    if (isLast) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login(),
                        ),
                      );
                    }
                  },
                  child: Text("NEXT"))
            ],
          )
        ],
      ),
    );
  }

  Widget onBoardingBuilder(boardingMaodel model) => SingleChildScrollView(
    child: Column(
          children: [
            ClipPath(
              child: Container(
                height: 500,
                color: Colors.blueGrey,
                child: Image(
                  image: AssetImage("${model.image}"),
                  height: 300,
                  width: 500,
                ),
              ),
              clipper: clipperS(),
            ),
            Text(
              "${model.title}",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
  );
}

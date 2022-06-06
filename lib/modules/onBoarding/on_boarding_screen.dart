import 'package:flutter/material.dart';
import 'package:green/modules/login/login_screen.dart';
import 'package:green/shared/Functions.dart';
import 'package:green/shared/components/DefaultTextButton.dart';
import 'package:green/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel
{
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/recycling_1.png',
      title: 'On Boarding Title 1',
      body: 'On Boarding Body 1',
    ),
    BoardingModel(
      image: 'assets/images/recycling_1.png',
      title: 'On Boarding Title 2',
      body: 'On Boarding Body 2',
    ),
    BoardingModel(
      image: 'assets/images/recycling_1.png',
      title: 'On Boarding Title 3',
      body: 'On Boarding Body 3',
    ),
    BoardingModel(
      image: 'assets/images/recycling_1.png',
      title: 'On Boarding Title 4',
      body: 'On Boarding Body 4',
    ),

  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: defaultTextButton(
                text: 'SKIP',
                textStyle: TextStyle(
                  color: greenColor,
                  fontWeight: FontWeight.w700,
                ),
              onPressed: () {
                navigateAndReplaceTo(LoginScreen(), context);
              }
            )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index)
                {
                  if(index == boarding.length - 1) isLast = true;
                  else isLast = false;
                },
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: greenColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count: boarding.length
                ),
                const Spacer(),
                FloatingActionButton(

                  onPressed: () {
                    if(isLast == true)
                      {
                        navigateAndReplaceTo(LoginScreen(), context);
                      }
                    else
                      {
                        boardController.nextPage(
                          duration: const Duration(
                              milliseconds: 750
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );

                      }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start, children: [
    Expanded(
        child: Image(image: AssetImage(model.image))
    ),
    const SizedBox(
      height: 30.0,
    ),
    Text(
      model.title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 15.0,
    ),
    Text(
      model.body,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
  ]);
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

//@CodeWithFlexz on Instagram

//AmirBayat0 on Github
//Programming with Flexz on Youtube

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animated Container',
      debugShowCheckedModeBanner: false,
      home: AnimatedContainerTest(),
    );
  }
}

class AnimatedContainerTest extends StatefulWidget {
  const AnimatedContainerTest({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerTest> createState() => _AnimatedContainerTestState();
}

class _AnimatedContainerTestState extends State<AnimatedContainerTest> {
  int index = 0;

  /// Title TextStyle
  TextStyle titletextStyle = const TextStyle(
      color: Colors.white, fontSize: 45, fontWeight: FontWeight.w300);

  /// SubTitle TextStyle
  TextStyle subTitletextStyle = const TextStyle(
      color: Color.fromARGB(255, 163, 163, 163),
      fontSize: 17,
      fontWeight: FontWeight.w300);

  /// Func For changing BackGround Container Width
  double changeContainerWidth(int index) {
    switch (index) {
      case 0:
        return 100;
      case 1:
        return 200;
      case 2:
        return 300;
      case 3:
        return 380;
      default:
        return 200;
    }
  }

  /// Center Content
  Widget centerContent(int index) {
    switch (index) {
      case 0:
        return RepCenterWidget(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'COMMIT TO IT',
          subTitle:
              'The most important step is to make a commitment to yourself that you will cultivate and support this mindset. It won’t be hard for you to find it, it’s available to all of us, but you’ll need to keep it at the forefront of everything you do. Your every word, every action, and every thought.',
        );
      case 1:
        return RepCenterWidget(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'SURROUND YOURSELF WITH SUCCESSFUL PEOPLE',
          subTitle:
              'Whether you like it or not, your thoughts and actions are influenced by those around you. If you want to reach success fast surround yourself with those who are already successful and are working to become more successful. I love seeing this at work in my Marketing for Consultants Coaching Program. This is where you can surround yourself with other consultants dedicated and committed to taking action and growing their business.',
        );
      case 2:
        return RepCenterWidget(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'GO FOR GROWTH',
          subTitle:
              'Another decision successful people make is to go for growth. They aren’t satisfied staying where they are. They want to constantly improve, learn, and prosper at higher levels. They are focused on results and taking every aspect of their lives to the next level. You can’t have the mindset of success if you’re comfortable with mediocrity.',
        );
      case 3:
        return RepCenterWidget(
          titletextStyle: titletextStyle,
          subTitletextStyle: subTitletextStyle,
          title: 'TAKE ACTION',
          subTitle:
              'The power of having a success mindset is that it doesn’t serve to only make you think and feel more successful. It influences the actions you take. Taking action is a critical part of success. In fact, without it we would simply fill our minds with positive thoughts and ideas – BUT it’s not until we bring those visions and ideas to life that we are rewarded for our commitment and intentions.',
        );

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      backgroundColor: index == 4
          ? const Color.fromARGB(255, 20, 20, 20)
          : const Color.fromARGB(255, 18, 18, 18),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          alignment: index == 4 ? Alignment.center : Alignment.centerLeft,
          children: [
            // MAIN BACKGROUND
            mainBg(size),

            /// BTNS
            index == 4 ? finishBtn() : twoBottomBtn(),

            /// Last Screen Lottie
            index == 4
                ? Lottie.asset('assets/1.json',
                    height: 250, animate: index == 4 ? true : false)
                : Container(),
            Center(
              child: centerContent(index),
            ),
          ],
        ),
      ),
    ));
  }

  /// TWO BOTTOM BUTTON
  Positioned twoBottomBtn() {
    return Positioned(
      bottom: 15,
      left: 60,
      right: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                index == 0 ? index = 4 : index--;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 54, 54, 54),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                size: 30,
              )),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                index == 4 ? index = 0 : index++;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 90,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 54, 54, 54),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// FINISH BUTTON
  Positioned finishBtn() {
    return Positioned(
      bottom: 15,
      left: 60,
      right: 60,
      child: GestureDetector(
        onTap: () {
          setState(() {
            index == 4 ? index = 0 : index++;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 90,
          height: 50,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 54, 54, 54),
              borderRadius: BorderRadius.circular(index == 4 ? 20 : 10)),
          child: const Center(
            child: Text(
              "Finish",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          ),
        ),
      ),
    );
  }

  /// MAIN BACKGROUND Container
  AnimatedContainer mainBg(Size size) {
    return AnimatedContainer(
      decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: index == 4 ? BorderRadius.circular(100) : null),
      width: changeContainerWidth(index),
      height: index == 4 ? 200 : size.height,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(
        milliseconds: 400,
      ),
    );
  }
}

/// APP BAR
class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: Column(
        children: const [
          Text("4 STEPS TO ACHIEVE SUCCESS"),
          SizedBox(
            height: 2,
          ),
          Text(
            "C O D E  W I T H  F L E X Z",
            style: TextStyle(color: Colors.white60, fontSize: 14),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

/// Center Widget Components
class RepCenterWidget extends StatelessWidget {
  const RepCenterWidget({
    Key? key,
    required this.titletextStyle,
    required this.subTitletextStyle,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final TextStyle titletextStyle;
  final TextStyle subTitletextStyle;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: titletextStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: subTitletextStyle,
          ),
        ),
      ],
    );
  }
}

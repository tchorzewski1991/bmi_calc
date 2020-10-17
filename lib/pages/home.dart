import 'package:bmi_calc/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color maleCardColor;
  Color femaleCardColor;
  Gender selectedGender;

  @override
  void initState() {
    maleCardColorActivator(reusableCardColorInactive);
    femaleCardColorActivator(reusableCardColorInactive);
    super.initState();
  }

  void updateGender(Gender gender) {
    selectedGender = gender;

    switch (selectedGender) {
      case Gender.male:
        maleCardColorActivator(reusableCardColorActive);
        femaleCardColorActivator(reusableCardColorInactive);
        break;
      case Gender.female:
        maleCardColorActivator(reusableCardColorInactive);
        femaleCardColorActivator(reusableCardColorActive);
        break;
    }
  }

  void maleCardColorActivator(Color color) {
    maleCardColor = color;
  }

  void femaleCardColorActivator(Color color) {
    femaleCardColor = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateGender(Gender.male);
                        });
                      },
                      onDoubleTap: () {
                        setState(() {
                          maleCardColor = reusableCardColorInactive;
                        });
                      },
                      child: ReusableCard(
                        color: maleCardColor,
                        child: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateGender(Gender.female);
                        });
                      },
                      onDoubleTap: () {
                        setState(() {
                          femaleCardColor = reusableCardColorInactive;
                        });
                      },
                      child: ReusableCard(
                        color: femaleCardColor,
                        child: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: reusableCardColor,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: reusableCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: reusableCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              color: bottomContainerColor,
            ),
          ],
        ),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({
    @required this.icon,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          label,
          style: TextStyle(
            color: iconContentTextColor,
            fontSize: 20.0,
          ),
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;

  ReusableCard({@required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: child,
    );
  }
}

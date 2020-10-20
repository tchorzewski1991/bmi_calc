import 'package:bmi_calc/consts.dart';
import 'package:bmi_calc/models/reusable_button.dart';
import 'package:bmi_calc/models/reusable_card.dart';
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
  double selectedHeight = 180.0;
  int selectedWeight = 60;
  int selectedAge = 25;

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'HEIGHT',
                            style: labelTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                selectedHeight.round().toString(),
                                style: numberTextStyle,
                              ),
                              SizedBox(height: 10.0, width: 3.0),
                              Text(
                                'cm',
                                style: labelTextStyle,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: sliderTrackColor,
                              thumbColor: sliderThumbColor,
                              overlayColor: sliderOverlayColor,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                              ),
                              overlayShape: RoundSliderOverlayShape(
                                overlayRadius: 25.0,
                              ),
                            ),
                            child: Slider(
                              value: selectedHeight,
                              inactiveColor: sliderColorInactive,
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newHeight) {
                                setState(() {
                                  selectedHeight = newHeight;
                                });
                              },
                            ),
                          )
                        ],
                      ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                selectedWeight.toString(),
                                style: numberTextStyle,
                              ),
                              SizedBox(height: 10.0, width: 3.0),
                              Text(
                                'kg',
                                style: labelTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ReusableButton(
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    selectedWeight += 1;
                                  });
                                },
                              ),
                              ReusableButton(
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    selectedWeight -= 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: reusableCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                selectedAge.toString(),
                                style: numberTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ReusableButton(
                                child: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    selectedAge += 1;
                                  });
                                },
                              ),
                              ReusableButton(
                                child: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    selectedAge -= 1;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/result');
              },
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: bottomContainerHeight,
                color: bottomContainerColor,
              ),
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
          style: labelTextStyle,
        )
      ],
    );
  }
}

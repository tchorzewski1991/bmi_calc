import 'package:bmi_calc/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                    child: ReusableCard(
                      color: reusableCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: reusableCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
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

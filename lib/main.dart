
import 'dart:ui';
import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WelcomeScreen();
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  StatisticsPage stat = StatisticsPage();
  AdvYoga advYoga = AdvYoga() ;
  RelaxYoga relax = RelaxYoga() ;
  EasyYoga easy = EasyYoga() ;

  int pageNo=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily : 'Poppins',
        textTheme: TextTheme(body1: TextStyle(color:Colors.purple[200])),
        scaffoldBackgroundColor: Color(0xFF280D2C)
      ),
      home : Scaffold(
        body: (pageNo==0)
          ? stat
          : (pageNo==1)
            ?
            easy
            : (pageNo==2) ?
            relax
              : (pageNo==3) ?
              advYoga
                : Container()

        ,
        bottomNavigationBar: CurvedNavigationBar(
          items: <Widget>[
            //Text("Analytics"),
            Icon(Icons.timeline, size: 30,color: Colors.black,),
            SizedBox(
              height: 30,
              child: Image.network("https://media.discordapp.net/attachments/726414674978930751/727113274533085254/baby.png?width=394&height=394")
            ),
            SizedBox(
              height: 34,
              child: Image.network("https://media.discordapp.net/attachments/726414674978930751/727114449613488169/relaxedicon.png?width=394&height=394")
            ),
            SizedBox(
              height: 30,
              child: Image.network("https://media.discordapp.net/attachments/726414674978930751/727115949316243527/yoda_head_2.png?width=720&height=394")
            ),
          ],
          backgroundColor:  Color(0),
          color: Colors.purple[200],
          onTap: (index){
            setState(() {
              pageNo = index;
            });
          },
        ),
//        bottomNavigationBar: CurvedNavigationBar(
//        ),

      )
    );
  }

}

class SineCurve extends Curve {

  @override
  double transformInternal(double t){
    return 4*sin(2*22/7*t)+4;
  }
}

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation<double> animation;
  double start = 0.0;
  double end =2;
  double temp ;
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() => setState(() {}));
    animation = Tween(
      begin: start,
      end: end
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: SineCurve()
    ));

    animationController.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.repeat();
      }
    });
  }

  @override
  void dispose(){
    if(animationController.status == AnimationStatus.forward || animationController.status == AnimationStatus.reverse)
    {
      animationController.notifyStatusListeners(AnimationStatus.dismissed);
    }
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Text(
            'YoGuru',
            style: TextStyle(
              fontSize: 65,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
          //SizedBox(height: 10,),
          Container(
            height: 380,
          padding: EdgeInsets.only(top: animation.value),
          child: SizedBox(
            height: 200,
            child: Image(
            image: AssetImage('assets/images/yoga grirl.png'),
        ),
          ),
      ),
          //SizedBox(height:400,width: 400,),
    //SizedBox(height: 10,),
    Container(
    child: BezierChart(
    bezierChartScale: BezierChartScale.CUSTOM,
    selectedValue: 30,
    xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
    footerValueBuilder: (double value) {
    return "${formatAsIntOrDouble(value)}\ndays";
    },
    series: const [
    BezierLine(
    lineColor: Colors.white70,
    label: "workout",
    data: const [
    DataPoint<double>(value: 10, xAxis: 0),
    DataPoint<double>(value: 130, xAxis: 5),
    DataPoint<double>(value: 50, xAxis: 10),
    DataPoint<double>(value: 150, xAxis: 15),
    DataPoint<double>(value: 75, xAxis: 20),
    DataPoint<double>(value: 0, xAxis: 25),
    DataPoint<double>(value: 5, xAxis: 30),
    DataPoint<double>(value: 45, xAxis: 35),
    ],
    ),
    ],
    config: BezierChartConfig(
    startYAxisFromNonZeroValue: false,
    bubbleIndicatorColor: Colors.white.withOpacity(0.9),
    footerHeight: 40,
    verticalIndicatorStrokeWidth: 3.0,
    verticalIndicatorColor: Colors.black26,
    showVerticalIndicator: true,
    verticalIndicatorFixedPosition: false,
    displayYAxis: false,
    stepsYAxis: 50,
    xLinesColor: Colors.red,
    snap: true,
    ),
    ),
    height: 250,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.purple[800].withOpacity(0.8),
    ),
    ),
    SizedBox(height: 20,),
    Container(
    child: BezierChart(
    bezierChartScale: BezierChartScale.CUSTOM,
    selectedValue: 30,
    xAxisCustomValues: const [0, 5, 10, 15, 20, 25, 30, 35],
    footerValueBuilder: (double value) {
    return "${formatAsIntOrDouble(value)}\ndays";
    },
    series: const [
    BezierLine(
    lineColor: Colors.white70,
    label: "workout",
    data: const [
    DataPoint<double>(value: 10, xAxis: 0),
    DataPoint<double>(value: 130, xAxis: 5),
    DataPoint<double>(value: 50, xAxis: 10),
    DataPoint<double>(value: 150, xAxis: 15),
    DataPoint<double>(value: 75, xAxis: 20),
    DataPoint<double>(value: 0, xAxis: 25),
    DataPoint<double>(value: 5, xAxis: 30),
    DataPoint<double>(value: 45, xAxis: 35),
    ],
    ),
    ],
    config: BezierChartConfig(
    startYAxisFromNonZeroValue: false,
    bubbleIndicatorColor: Colors.white.withOpacity(0.9),
    footerHeight: 40,
    verticalIndicatorStrokeWidth: 3.0,
    verticalIndicatorColor: Colors.black26,
    showVerticalIndicator: true,
    verticalIndicatorFixedPosition: false,
    displayYAxis: false,
    stepsYAxis: 50,
    xLinesColor: Colors.red,
    snap: true,
    ),
    ),
    height: 250,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    color: Colors.purple[800].withOpacity(0.8),
    ),
    ),

    ],
    ),
    ),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
    image:DecorationImage(
    image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcdn150.picsart.com%2Fupscale-240138287052212.png&f=1&nofb=1"),
    repeat: ImageRepeat.repeat
    ),
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.purple[900], Color(0xFF280D2C)]
    ),
    ),
    )
    );;
  }
}

class AdvYoga extends StatefulWidget {
  @override
  _AdvYogaState createState() => _AdvYogaState();
}

class _AdvYogaState extends State<AdvYoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcdn150.picsart.com%2Fupscale-240138287052212.png&f=1&nofb=1"),
            repeat: ImageRepeat.repeat
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors: [Colors.purple[900], Color(0xFF280D2C)]
          )
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height:10),
                Text(
                  "Advanced Yoga",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.purple[200]
                  ),
                ),
                SizedBox(height: 10,),
                Excersice(
                  title: "Wheel Pose",
                  imageLoc: "assets/images/wheelpose cropped.png",
                  description: "The knees and feet tend to splay as you lift into this pose, which compresses the lower back. In the beginning position, loop and secure a strap around your thighs, just above the knees, to hold the thighs at hip width and parallel to each other. To keep the feet from turning out, place a block between them, with the bases of the big toes pressing the ends of the block. As you go up, press the feet into the block",
                ),
                Excersice(
                  title: "Scorpion Pose",
                  imageLoc: "assets/images/scorpion cropped.png",
                  description: "asdasd",
                ),
                Excersice(
                  title: "Monkey Pose",
                  imageLoc: "assets/images/wheelpose cropped.png",
                  description: "asdasdasd",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RelaxYoga extends StatefulWidget {
  @override
  _RelaxYogaState createState() => _RelaxYogaState();
}

class _RelaxYogaState extends State<RelaxYoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcdn150.picsart.com%2Fupscale-240138287052212.png&f=1&nofb=1"),
            repeat: ImageRepeat.repeat
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors: [Colors.purple[900], Color(0xFF280D2C)]
          )
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height:10),
                Text(
                  "Relaxed Yoga",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.purple[200]
                  ),
                ),
                SizedBox(height: 10,),
                Excersice(
                  title: "Seated Spinal Twist",
                  imageLoc: "assets/images/relax/SeatedSpinalTwist cropped.png",
                  description: "stay in a forward fold with your forearms on the floor. Snake whichever leg is forward back to meet the other leg. This is a fun way to come straight into sphinx, but if that doesn't work just make your way onto your belly another way. This pose in the perfect way to counteract the forward slumping of a long day spent sitting at the computer. Be sure to press firmly into your forearms, which will help keep your shoulders away from your ears.",
                ),
                Excersice(
                  title: "Sphinx",
                  imageLoc: "assets/images/relax/sphinx cropped.png",
                  description: "asdasd",
                ),
                Excersice(
                  title: "Triangle Pose",
                  imageLoc: "assets/images/relax/trianglepose cropped.png",
                  description: "asdasdasd",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EasyYoga extends StatefulWidget {
  @override
  _EasyYogaState createState() => _EasyYogaState();
}

class _EasyYogaState extends State<EasyYoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fcdn150.picsart.com%2Fupscale-240138287052212.png&f=1&nofb=1"),
            repeat: ImageRepeat.repeat
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end:Alignment.bottomCenter,
            colors: [Colors.purple[900], Color(0xFF280D2C)]
          )
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height:10),
                Text(
                  "Easy Yoga",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.purple[200]
                  ),
                ),
                SizedBox(height: 10,),
                Excersice(
                  title: "Downward Facing Dog",
                  imageLoc: "assets/images/easy/DownwardFacingDog cropped.png",
                  description: "Beginners often lean too far forward in this posture, making it more like a plank. Instead, remember to keep your weight mostly in your legs and reach your hips high, with your heels stretching toward the floor (they do not need to touch the floor). Bend your knees a little to facilitate the move if you have tight hamstrings. Keep feet parallel.",
                ),
                Excersice(
                  title: "Mountain Pose",
                  imageLoc: "assets/images/easy/mountainpose cropped.png",
                  description: "asdasd",
                ),
                Excersice(
                  title: "Warrior Pose",
                  imageLoc: "assets/images/easy/welcome.png",
                  description: "asdasdasd",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Excersice extends StatefulWidget {
  String title , imageLoc , description ;
  Excersice({this.title,this.imageLoc,this.description});

  @override
  _ExcersiceState createState() => _ExcersiceState();
}
class _ExcersiceState extends State<Excersice> {
  bool show = true ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          show = ! show ;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color : Colors.purple[700],
          boxShadow:
            [
             BoxShadow(
               color: Colors.pink[100].withOpacity(0.3),
               spreadRadius: 3,
               blurRadius:1,
               offset: Offset(4,2)
             )
            ]
        ),
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),

        child: Column(
          children: <Widget>[
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30
              ),
            ),
            SizedBox(
              //height:300,
              width:300,
              child: Image.asset(widget.imageLoc)
            ),
            AnimatedCrossFade(
                duration: Duration(seconds: 1),
                crossFadeState: show ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
                firstChild: Text(
                  "Tap to See More",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                secondChild: Text(
                  widget.description ,
                  softWrap: true,
                ),
            ),
          ],
        ),
    )
    );
  }
}

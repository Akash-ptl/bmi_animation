import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

enum Gender {
  Male,
  Female,
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  String interpretation = "";
  double _bmi = 0;
  Gender? selectedGender;
  double height = 160;
  int weight = 60;
  int age = 28;
  String message = '';
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff090E21),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    child: SlideInLeft(
                      child: Container(
                        height: h,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: selectedGender == Gender.Male
                              ? const Color(0xff3B3C4D)
                              : const Color(0xff1D1E33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.male,
                              size: 80,
                              color: Colors.white,
                            ),
                            Text(
                              "Male",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 30)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                    child: SlideInRight(
                      delay: Duration(seconds: 1),
                      child: Container(
                        height: h,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: selectedGender == Gender.Female
                              ? const Color(0xff3B3C4D)
                              : const Color(0xff1D1E33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.female,
                              size: 80,
                              color: Color(0xffEB1555),
                            ),
                            Text(
                              "Female",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              flex: 1,
              child: FadeInDown(
                delay: Duration(seconds: 2),
                child: Container(
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff1D1E33),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _bmi.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 40, color: Colors.white),
                        ),
                        const Text(
                          ' kg/m² ',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff626473),
                              height: 4),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 100)),
                        Text(
                          message,
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xffEB1555)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              flex: 3,
              child: FadeInUp(
                delay: Duration(seconds: 3),
                child: Container(
                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xff1D1E33),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "HEIGHT",
                        style: TextStyle(
                            fontSize: 15, color: Color(0xff626473), height: 5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${height.toInt()}",
                            style: const TextStyle(
                                fontSize: 70, color: Colors.white, height: 1.3),
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff626473),
                                height: 6),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: SliderTheme(
                          data: const SliderThemeData(
                              trackHeight: 1,
                              activeTrackColor: Color(0xffF5C1D1),
                              overlayColor: Color(0xff555555),
                              thumbColor: Color(0xffEB1555),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 8)),
                          child: Slider(
                            min: 0,
                            max: 280,
                            divisions: 279,
                            value: height,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideInLeft(
                    delay: Duration(seconds: 4),
                    child: Container(
                      height: h,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff1D1E33),
                      ),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          const Text(
                            "Weight",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            "$weight",
                            style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xff4C4F5E),
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10)),
                              FloatingActionButton(
                                  backgroundColor: const Color(0xff6E6F7A),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xffF67FA4),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 30)),
                  SlideInRight(
                    delay: Duration(seconds: 5),
                    child: Container(
                      height: h,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xff1D1E33),
                      ),
                      child: Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(bottom: 20)),
                          const Text(
                            "Age",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            "$age",
                            style: const TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(bottom: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                backgroundColor: const Color(0xff4C4F5E),
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(right: 10)),
                              FloatingActionButton(
                                  backgroundColor: const Color(0xff6E6F7A),
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Color(0xffF67FA4),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _bmi = weight / pow(height / 100, 2);

                    if (_bmi < 18.5) {
                      message = "You are underweight";
                    } else if (_bmi < 25) {
                      message = 'You body is fine';
                    } else if (_bmi < 30) {
                      message = 'You are overweight';
                    } else {
                      message = 'You are obese';
                    }
                  });
                },
                child: FadeInUp(
                  delay: Duration(seconds: 6),
                  child: Container(
                    height: h,
                    width: w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffEB1555),
                    ),
                    child: const Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff090E21),
    );
  }
}

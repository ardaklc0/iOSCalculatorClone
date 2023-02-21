import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Hesap Makinesi'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double numberInput_1 = 0.0;
  double numberInput_2 = 0.0;
  String operator = "";
  String output = "0";
  List<double> numberList = [];

  buttonPressed(String numberKey) {
    if (numberKey == "AC") {
      numberInput_1 = 0.0;
      numberInput_2 = 0.0;
      operator = "";
      output = "0";

    } else if (numberKey == "+/-") {
      if (!double.parse(output).isNegative) {
        output = "-"+output;
      } else {
        output = output.replaceFirst("-", "");
      }
    } else if (numberKey == "%") {


    } else if (numberKey == "+" ||numberKey == "/" ||numberKey == "*" ||numberKey == "-") {
      numberInput_1 = double.parse(output);
      operator = numberKey;
      output = "0";
    } else if (numberKey == ".") {
        output = output + numberKey;
    } else if (numberKey == "=") {
      numberInput_2 = double.parse(output);
      if (operator == "+") {
        output = (numberInput_1 + numberInput_2).toString();
      }
      if (operator == "-") {
        output = (numberInput_1 - numberInput_2).toString();
      }
      if (operator == "*") {
        output = (numberInput_1 * numberInput_2).toString();
      }
      if (operator == "/") {
        output = (numberInput_1 / numberInput_2).toString();
      }
      numberInput_1 = 0.0;
      numberInput_2 = 0.0;
      operator = "";
    } else {
      if (output == "0" || output == "-0") {
        output = numberKey;
      } else {
      output = output + numberKey;
      }
    }

    setState(() {});
  }


  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 100,
            width: 330,
            alignment: Alignment.centerRight,
            child: Text(
              output,
              style: TextStyle(
                fontSize: 70,
                color: Colors.white,
                fontFamily: "Helvetica"
              ),
            ),
          ),
          SizedBox(
            height: 15
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              iconButton(buttonPressed, "AC"),
              iconButton(buttonPressed, "+/-"),
              iconButton(buttonPressed, "%"),
              divideButton(buttonPressed),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              numberButton(buttonPressed, "7"),
              numberButton(buttonPressed, "8"),
              numberButton(buttonPressed, "9"),
              multiplyButton(buttonPressed),

            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              numberButton(buttonPressed, "4"),
              numberButton(buttonPressed, "5"),
              numberButton(buttonPressed, "6"),
              substractButton(buttonPressed)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              numberButton(buttonPressed, "1"),
              numberButton(buttonPressed, "2"),
              numberButton(buttonPressed, "3"),
              addButton(buttonPressed)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              zeroButton(buttonPressed),
              commaButton(buttonPressed),
              equalButton(buttonPressed),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }



}

class equalButton extends StatelessWidget {
  Function buttonPressed;
  equalButton(this.buttonPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(246,153,6, 1),
          minimumSize: const Size.fromRadius(40.0),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20)),
      onPressed: () {
        buttonPressed("=");
      },
      child:const  Text(
        "=",
        style: TextStyle(
          fontSize: 36,
            fontFamily: 'Helvetica'
        ),
      ),
    );
  }
}

class commaButton extends StatelessWidget {
  Function buttonPressed;
  commaButton(this.buttonPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        buttonPressed(".");
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(49, 49, 49, 1),
          minimumSize: const Size.fromRadius(40.0),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20)),
      child: const Text(
          ".",
      style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class zeroButton extends StatelessWidget {
  Function buttonPressed;
  zeroButton(this.buttonPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86*2,
      height: 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(49, 49, 49, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        onPressed: () {
          buttonPressed("0");
        },
        child: Container(
          alignment: Alignment.centerLeft,
          height: 34,
          width: 57*2,
          child: const Text(
              "0",
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'Helvetica'
            ),
          ),
        ),
      ),
    );
  }
}

class addButton extends StatelessWidget {
  Function buttonPressed;
  addButton(this.buttonPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonPressed("+");
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(246,153,6, 1),
            minimumSize: const Size.fromRadius(40.0),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20)),
        child: const Text(
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Helvetica'
            ),
            "+",

        )
    );
  }
}

class substractButton extends StatelessWidget {
  Function buttonPressed;
  substractButton(this.buttonPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonPressed("-");
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(246,153,6, 1),
            minimumSize: const Size.fromRadius(40.0),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20)),
        child: const Text(
            style: TextStyle(
                fontSize: 40,
                fontFamily: 'Helvetica'
            ),
            "-"
        )
    );
  }
}

class multiplyButton extends StatelessWidget {
  Function buttonPressed;
  multiplyButton(this.buttonPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonPressed("*");
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(246,153,6, 1),
            minimumSize: const Size.fromRadius(40.0),
            shape: const CircleBorder(),
            padding:const  EdgeInsets.all(20)),
        child: const  Text(
            style: TextStyle(
                fontSize: 35,
                fontFamily: 'Helvetica'
            ),
            "x"
        )
    );
  }
}

class divideButton extends StatelessWidget {
  Function buttonPressed;
  divideButton(this.buttonPressed, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonPressed("/");
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(246,153,6, 1),
            minimumSize: const Size.fromRadius(40.0),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20)),
        child: const Text(
            style:const  TextStyle(
                fontSize: 30,
                fontFamily: 'Helvetica'
            ),
            "÷"
        )
    );
  }
}

class iconButton extends StatefulWidget {
  Function buttonPressed;
  final String? iconName;

  iconButton(this.buttonPressed,
      this.iconName,{
    Key? key,
  }) : super(key: key);

  @override
  State<iconButton> createState() => _iconButtonState();
}

class _iconButtonState extends State<iconButton> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.buttonPressed(widget.iconName);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(159,159,159, 1),
          minimumSize: const Size.fromRadius(40.0),
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20)),
      child: Text(
        widget.iconName!,
        style: const TextStyle(
          color: Colors.black,
            fontSize: 30,
            fontFamily: 'Helvetica'
        ),
      ),
    );
  }
}

class numberButton extends StatefulWidget {
  Function buttonPressed;
  final String? numberKey;
  numberButton(this.buttonPressed, this.numberKey,{Key? key}) : super(key: key);

  @override
  State<numberButton> createState() => _numberButtonState();
}

class _numberButtonState extends State<numberButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.buttonPressed(widget.numberKey);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(49, 49, 49, 1),
        minimumSize: const Size.fromRadius(40.0),
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20)),
      child: Text(
          widget.numberKey!,
        style: const TextStyle(
            fontSize: 40,
            fontFamily: 'Helvetica',
        ),
      ),
    );
  }
}





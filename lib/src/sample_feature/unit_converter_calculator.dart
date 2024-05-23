import 'package:flutter/material.dart';

class UnitConverterCalculator extends StatefulWidget {
  const UnitConverterCalculator({super.key});

  static const String title = 'Measures Converter';

  @override
  UnitConverterCalculatorState createState() => UnitConverterCalculatorState();
}

class UnitConverterCalculatorState extends State<UnitConverterCalculator> {
  double _numberFrom = 0;
  static const EdgeInsets edgeInsetsAll10 = EdgeInsets.all(10);

  @override
  void initState() {
    _numberFrom = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UnitConverterCalculator.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
              child: Column(
            children: [
              const Padding(
                padding: edgeInsetsAll10,
                child: Text(UnitConverterCalculator.title),
              ),
              Padding(
                padding: edgeInsetsAll10,
                child: TextField(
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                ),
              ),
              Padding(
                padding: edgeInsetsAll10,
                child:
                    Text((_numberFrom == null) ? '' : _numberFrom.toString()),
              )
            ],
          )),
        ),
      ),
    );
  }
}

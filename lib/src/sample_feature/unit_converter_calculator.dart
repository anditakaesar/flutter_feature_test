import 'package:flutter/material.dart';

class UnitConverterCalculator extends StatefulWidget {
  const UnitConverterCalculator({super.key});

  static const String title = 'Measures Converter';

  @override
  UnitConverterCalculatorState createState() => UnitConverterCalculatorState();
}

class UnitConverterCalculatorState extends State<UnitConverterCalculator> {
  final Map<String, int> _measureMap = {
    'meters': 0,
    'kilometers': 1,
    'grams': 2,
    'kilograms': 3,
    'feet': 4,
    'miles': 5,
    'pounds (lbs)': 6,
    'ounces': 7,
  };
  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
  };

  double _numberFrom = 0;
  String? _startMeasure;
  String? _endMeasure;
  String? _resultMessage;
  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];

  void convert(double value, String from, String to) {
    int? nFrom = _measureMap[from];
    int? nTo = _measureMap[to];
    var multiplier = _formulas[nFrom.toString()][nTo];
    double result = value * multiplier;
    if (result == 0) {
      _resultMessage = 'This conversion cannot be performed';
    } else {
      _resultMessage =
          '${_numberFrom.toString()} $_startMeasure are ${result.toString()} $_endMeasure';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }

  bool checkInputs() {
    return _startMeasure!.isEmpty || _endMeasure!.isEmpty || _numberFrom == 0;
  }

  final TextStyle inputStyle = TextStyle(
    fontSize: 20,
    color: Colors.blue[900],
  );

  final TextStyle labelStyle = TextStyle(
    fontSize: 24,
    color: Colors.grey[700],
  );

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Value',
                  style: labelStyle,
                ),
                TextField(
                  style: inputStyle,
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Please insert the measure to be converted',
                  ),
                ),
                Text(
                  'From',
                  style: labelStyle,
                ),
                DropdownButton(
                  isExpanded: true,
                  value: _startMeasure,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasure = value;
                    });
                  },
                ),
                Text(
                  'To',
                  style: labelStyle,
                ),
                DropdownButton(
                  isExpanded: true,
                  value: _endMeasure,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _endMeasure = value;
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('Convert'),
                  onPressed: () {
                    if (checkInputs()) {
                      return;
                    }
                    convert(_numberFrom, _startMeasure!, _endMeasure!);
                  },
                ),
                Text(_resultMessage ?? _numberFrom.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

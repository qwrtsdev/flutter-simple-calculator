import 'package:flutter/material.dart';
import 'calculate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  String resultEquals = '';
  var history = <String>[];
  var operator = '';

  void handleClick(String operator) {
    setState(() {
      this.operator = operator;
      var calculatedResult = calculate(
        double.tryParse(controller1.text) ?? 0,
        operator,
        double.tryParse(controller2.text) ?? 0,
      );

      resultEquals = '= ${calculatedResult.toString()}';
      history.add('${controller1.text} $operator ${controller2.text} $resultEquals');
      if (history.length > 20) {
        history.removeAt(0);
      }

      debugPrint(history.toString());
    });
  }

  void clear() {
    setState(() {
      history.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 100.0 : 20.0,
                vertical: 20.0,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller1,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'First Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          operator,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controller2,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Second Number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          resultEquals,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => handleClick('+'),
                          child: const Text('+', style: TextStyle(fontSize: 20)),
                        ),
                        ElevatedButton(
                          onPressed: () => handleClick('-'),
                          child: const Text('-', style: TextStyle(fontSize: 20)),
                        ),
                        ElevatedButton(
                          onPressed: () => handleClick('*'),
                          child: const Text('*', style: TextStyle(fontSize: 20)),
                        ),
                        ElevatedButton(
                          onPressed: () => handleClick('/'),
                          child: const Text('/', style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 5 * 56.0,
                      child: ListView.builder(
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          final entry = history.reversed.toList()[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Text(entry.toString()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: clear,
                      child: const Text('Clear History', style: TextStyle(fontSize: 15)),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
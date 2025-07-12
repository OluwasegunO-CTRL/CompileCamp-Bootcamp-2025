import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week2_app/logic/calc_logic.dart';
import 'package:week2_app/model/calc_model.dart';
import 'package:week2_app/logic/scientific_calc.dart';
import 'package:week2_app/widgets/build_display.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});
  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  CalculatorState _state = const CalculatorState();
  bool _showHistory = false;
  
  // Calculator button layout
  final List<List<CalculatorButton>> _buttonLayout = [
    [
      CalculatorButton(text: "MC", value: "MC", type: ButtonType.memory),
      CalculatorButton(text: "MR", value: "MR", type: ButtonType.memory),
      CalculatorButton(text: "M+", value: "M+", type: ButtonType.memory),
      CalculatorButton(text: "M-", value: "M-", type: ButtonType.memory),
    ],
    [
      CalculatorButton(text: "C", value: "C", type: ButtonType.utility, color: Colors.red[400]),
      CalculatorButton(text: "CE", value: "CE", type: ButtonType.utility),
      CalculatorButton(text: "√", value: "√", type: ButtonType.function),
      CalculatorButton(text: "÷", value: "÷", type: ButtonType.operation, color: Colors.orange),
    ],
    [
      CalculatorButton(text: "7", value: "7", type: ButtonType.number),
      CalculatorButton(text: "8", value: "8", type: ButtonType.number),
      CalculatorButton(text: "9", value: "9", type: ButtonType.number),
      CalculatorButton(text: "×", value: "×", type: ButtonType.operation, color: Colors.orange),
    ],
    [
      CalculatorButton(text: "4", value: "4", type: ButtonType.number),
      CalculatorButton(text: "5", value: "5", type: ButtonType.number),
      CalculatorButton(text: "6", value: "6", type: ButtonType.number),
      CalculatorButton(text: "-", value: "-", type: ButtonType.operation, color: Colors.orange),
    ],
    [
      CalculatorButton(text: "1", value: "1", type: ButtonType.number),
      CalculatorButton(text: "2", value: "2", type: ButtonType.number),
      CalculatorButton(text: "3", value: "3", type: ButtonType.number),
      CalculatorButton(text: "+", value: "+", type: ButtonType.operation, color: Colors.orange),
    ],
    [
      CalculatorButton(text: "±", value: "±", type: ButtonType.function),
      CalculatorButton(text: "0", value: "0", type: ButtonType.number),
      CalculatorButton(text: ".", value: ".", type: ButtonType.number),
      CalculatorButton(text: "=", value: "=", type: ButtonType.operation, color: Colors.blue),
    ],
    [
      CalculatorButton(text: "sin", value: "sin", type: ButtonType.function),
      CalculatorButton(text: "cos", value: "cos", type: ButtonType.function),
      CalculatorButton(text: "tan", value: "tan", type: ButtonType.function),
      CalculatorButton(text: "log", value: "log", type: ButtonType.function),
    ],
    [
      CalculatorButton(text: "ln", value: "ln", type: ButtonType.function),
      CalculatorButton(text: "x²", value: "x²", type: ButtonType.function),
      CalculatorButton(text: "x³", value: "x³", type: ButtonType.function),
      CalculatorButton(text: "1/x", value: "1/x", type: ButtonType.function),
    ],
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Display area
            BuildDisplay(_state),
            
            // History toggle
            _buildHistoryToggle(),
            
            // Calculator buttons or history
            Expanded(
              child: _showHistory ? _buildHistory() : _buildButtonGrid(),
            ),
          ],
        ),
      ),
    );
  }
  
  
  Widget _buildHistoryToggle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _showHistory ? "Calculator" : "History (${_state.history.length})",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
          IconButton(
            icon: Icon(
              _showHistory ? Icons.calculate : Icons.history,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _showHistory = !_showHistory;
              });
            },
          ),
        ],
      ),
    );
  }
  
  Widget _buildButtonGrid() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: _buttonLayout.map((row) {
          return Expanded(
            child: Row(
              children: row.map((button) {
                return Expanded(
                  child: _buildCalculatorButton(button),
                );
              }).toList(),
            ),
          );
        }).toList(),
      ),
    );
  }
  
  Widget _buildCalculatorButton(CalculatorButton button) {
    final isPressed = _state.operation == button.value;
    
    return Container(
      margin: EdgeInsets.all(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleButtonPress(button.value),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: BoxDecoration(
              color: isPressed 
                  ? Colors.white 
                  : button.color ?? _getDefaultButtonColor(button.type),
              borderRadius: BorderRadius.circular(50),
              border: isPressed 
                  ? Border.all(color: Colors.orange, width: 2)
                  : null,
            ),
            child: Center(
              child: Text(
                button.text,
                style: TextStyle(
                  color: isPressed 
                      ? Colors.orange 
                      : button.textColor ?? _getDefaultTextColor(button.type),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  
  Color _getDefaultButtonColor(ButtonType type) {
    switch (type) {
      case ButtonType.number:
        return Colors.grey[800]!;
      case ButtonType.operation:
        return Colors.orange;
      case ButtonType.function:
        return Colors.grey[600]!;
      case ButtonType.memory:
        return Colors.blue[700]!;
      case ButtonType.utility:
        return Colors.grey[600]!;
    }
  }
  
  Color _getDefaultTextColor(ButtonType type) {
    switch (type) {
      case ButtonType.operation:
        return Colors.white;
      default:
        return Colors.white;
    }
  }
  
  Widget _buildHistory() {
    if (_state.history.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              "No calculations yet",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ],
        ),
      );
    }
    
    return Column(
      children: [
        // Clear history button
        Container(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: _clearHistory,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[400],
            ),
            child: Text("Clear History"),
          ),
        ),
        
        // History list
        Expanded(
          child: ListView.builder(
            itemCount: _state.history.length,
            reverse: true,
            itemBuilder: (context, index) {
              final historyItem = _state.history[_state.history.length - 1 - index];
              return _buildHistoryItem(historyItem);
            },
          ),
        ),
      ],
    );
  }
  
  Widget _buildHistoryItem(CalculationHistory item) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      color: Colors.grey[850],
      child: ListTile(
        title: Text(
          item.expression,
          style: TextStyle(color: Colors.grey[300]),
        ),
        subtitle: Text(
          "= ${item.result}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          "${item.timestamp.hour.toString().padLeft(2, '0')}:${item.timestamp.minute.toString().padLeft(2, '0')}",
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () => _useHistoryResult(item.result),
      ),
    );
  }
  
  void _handleButtonPress(String value) {
    // Haptic feedback
    HapticFeedback.lightImpact();
    
    setState(() {
      _state = CalculatorLogic.processInput(_state, value);
      if (value == "sin" || value == "cos" || value == "tan" || 
          value == "log" || value == "ln" || value == "x²" || 
          value == "x³" || value == "1/x") {
        _state = ScientificCalculator.handleScientificFunction(_state, value);
      }
    });
  }
  
  void _clearHistory() {
    setState(() {
      _state = _state.copyWith(history: []);
    });
  }
  
  void _useHistoryResult(String result) {
    final value = double.tryParse(result);
    if (value != null) {
      setState(() {
        _state = _state.copyWith(
          display: result,
          currentValue: value,
          shouldResetDisplay: true,
        );
        _showHistory = false;
      });
    }
  }
}

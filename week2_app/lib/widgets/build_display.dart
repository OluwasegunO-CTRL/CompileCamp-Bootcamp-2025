import 'package:flutter/material.dart';
import 'package:week2_app/model/calc_model.dart';
import 'package:week2_app/logic/calc_logic.dart';

class BuildDisplay extends StatelessWidget {
  const BuildDisplay(this._state, {super.key});

  final CalculatorState _state;

  double _getDisplayFontSize() {
    final length = _state.display.length;
    if (length <= 8) return 48;
    if (length <= 10) return 40;
    if (length <= 12) return 32;
    return 24;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Memory indicator
          if (_state.memory != 0)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "M",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          
          SizedBox(height: 8),
          
          // Current operation display
          if (_state.operation != null && _state.previousValue != null)
            Text(
              "${CalculatorLogic.formatDisplay(_state.previousValue!)} ${_state.operation}",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          
          SizedBox(height: 8),
          
          // Main display
          SizedBox(
            width: double.infinity,
            child: Text(
              _state.display,
              style: TextStyle(
                color: Colors.white,
                fontSize: _getDisplayFontSize(),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
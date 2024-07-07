import 'package:flutter/material.dart';

import '../model/accordion_model.dart';

class AccordionPage extends StatefulWidget {
  AccordionPage({Key? key}) : super(key: key);

  @override
  _AccordionPageState createState() => _AccordionPageState();
}

class _AccordionPageState extends State<AccordionPage>
    with TickerProviderStateMixin {
  late List<AnimationController> _animationControllers;
  int? _expandedIndex;

  @override
  void initState() {
    super.initState();
    _animationControllers = List.generate(
      data.length,
      (index) => AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _handleTileExpanded(int index, bool expanded) {
    setState(() {
      if (expanded) {
        _expandedIndex = index;
        _animationControllers[index].forward();
      } else {
        if (_expandedIndex == index) {
          _expandedIndex = null;
        }
        _animationControllers[index].reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(data.length, (index) {
          var currentModel = data[index];
          return ExpansionContainer(
            // Use the custom ExpansionContainer
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                key: GlobalKey(),
                initiallyExpanded: _expandedIndex == index,
                onExpansionChanged: (bool expanded) {
                  _handleTileExpanded(index, expanded);
                },
                title: Text(currentModel.label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onBackground)),
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  child: Text(currentModel.label.substring(0, 1),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.background)),
                ),
                children: [
                  SizeTransition(
                    sizeFactor: CurvedAnimation(
                      parent: _animationControllers[index],
                      curve: Curves.fastOutSlowIn,
                    ),
                    child: Column(
                        children: currentModel.aylikToplam.map((ay) {
                      return ListTile(
                          title: Text(
                              '${ay.label}: ${ay.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground)));
                    }).toList()),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ExpansionContainer extends StatelessWidget {
  final Widget child;
  const ExpansionContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:
            Theme.of(context).colorScheme.surface, // Adapt color based on theme
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

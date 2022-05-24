import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import the language & theme
import 'package:highlight/languages/dart.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class DescOrPseudo extends StatefulWidget {
  int tutorialState;
  DescOrPseudo({required this.tutorialState, Key? key}) : super(key: key);

  @override
  State<DescOrPseudo> createState() => _DescOrPseudoState();
}

class _DescOrPseudoState extends State<DescOrPseudo> {

  String data='';

  fetchFileData() async {
    String responseText;
    if(widget.tutorialState == 1) {
      responseText = await rootBundle.loadString('text_documents/dfs_pseudocod.txt');
    } else {
      responseText = await rootBundle.loadString('text_documents/dfs_description.txt');
    }
    setState(() {
      data=responseText;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFileData();
  }

  @override
  Widget build(BuildContext context) {
    fetchFileData();
    if (widget.tutorialState == 0) {
      return Text(data);
    } else {
      return CodeField(
        controller: CodeController(
          text: data,
          language: dart,
          theme: monokaiSublimeTheme,
        ),
        textStyle: const TextStyle(fontFamily: 'SourceCode'),
      );
    }
  }
}

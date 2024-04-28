import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/pini.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/providers/piniary_provider.dart';
import 'package:piniary/widgets/app_bar.dart';
import 'package:piniary/widgets/pini_selector.dart';
import 'package:piniary/widgets/pini_sticker.dart';
import 'package:provider/provider.dart';

class PiniaryDetailScreen extends StatefulWidget {
  final Piniary piniary;
  const PiniaryDetailScreen({super.key, required this.piniary});

  @override
  State<PiniaryDetailScreen> createState() => _PiniaryDetailScreenState();
}

class _PiniaryDetailScreenState extends State<PiniaryDetailScreen> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
      text: widget.piniary.content,
    );
  }

  void showPiniSelectBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return PiniSelector(
          piniary: widget.piniary,
        );
      },
    ).then((pini) {
      setState(() {
        if (pini != null) widget.piniary.pini = pini;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: const PiniaryAppBar(
          showSettingIcon: false,
        ),
        bottomNavigationBar: BottomAppBar(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.piniary.content = textController.text;
                      if (widget.piniary.pini == Pini.none) {
                        showPiniSelectBottomSheet();
                        return;
                      }
                      context
                          .read<PiniaryProvider>()
                          .savePiniary(widget.piniary);
                      Fluttertoast.showToast(
                        msg: '저장되었습니다.',
                      );
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Icon(Icons.check_outlined),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd').format(widget.piniary.date),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    Hero(
                      tag: DateFormat('yyyy-MM-dd').format(widget.piniary.date),
                      child: GestureDetector(
                        onTap: () {
                          showPiniSelectBottomSheet();
                        },
                        child: PiniSticker(
                          pini: widget.piniary.pini,
                          size: 80,
                        ),
                      ),
                    ),
                  ],
                ),
                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 50,
                  controller: textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "오늘 하루를 피니로 기록해보세요.",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

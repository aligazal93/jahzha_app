import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class AccordionCard extends StatefulWidget {
  final String title;
  final String content;

  const AccordionCard({Key? key, required this.title, required this.content})
      : super(key: key);
  @override
  State<AccordionCard> createState() => AccordionCardState();
}

class AccordionCardState extends State<AccordionCard> {
  // Show or hide the content
  bool _showContent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 14,horizontal: 10),
      color: AppColors.whiteBk,
      elevation: 0.0,
      child: Column(
        children: [
          // The title
          ListTile(
            title: AppText(
              title: widget.title,
              color: AppColors.secondary,
              fontSize: 14,
              textAlign: TextAlign.right,
            ),
            trailing: IconButton(
              icon: Icon(
                _showContent
                    ? FontAwesomeIcons.angleUp
                    : FontAwesomeIcons.angleDown,
                size: 18,
                color: AppColors.txtGray,
              ),
              onPressed: () {
                setState(() {
                  _showContent = !_showContent;
                });
              },
            ),
          ),
          // Show or hide the content based on the state
          AnimatedSize(
            child: Container(
              padding: _showContent ? const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ) : EdgeInsets.zero,
              child: _showContent
                  ? Html(
                data: widget.content,
                style: {
                  "p": Style(
                    fontSize: FontSize.small,
                    lineHeight: LineHeight.number(1.5),
                    height: Height.auto()
                  )
                },
              )
                  : null,
            ),
            duration: Duration(milliseconds: 400),
          ),
        ],
      ),
    );
  }
}

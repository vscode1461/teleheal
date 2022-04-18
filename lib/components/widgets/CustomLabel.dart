import 'package:flutter/material.dart';
import 'package:teleheal_assignment/components/utils/CustomStyle.dart';

class CustomLabel {
  static getTitle({context, @required title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: CustomStyle.getStyleTitle(),
      ),
    );
  }

  static getLabelField({context, @required title}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.fromLTRB(5, 0, 0, 8),
      child: Text(
        title,
        style: CustomStyle.getStyleLabelField(),
      ),
    );
  }
}

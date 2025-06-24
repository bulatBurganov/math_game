import 'package:flutter/material.dart';

class AppAlertDropDown extends StatefulWidget {
  const AppAlertDropDown({
    Key? key,
    required this.errorMessage,
    this.errorSubText,
    this.isError,
    this.isSuccess,
    this.isWarning,
    this.isNeutral,
  }) : super(key: key);
  final bool? isError;
  final bool? isSuccess;
  final bool? isWarning;
  final bool? isNeutral;
  final String errorMessage;
  final String? errorSubText;

  @override
  State<StatefulWidget> createState() => AppAlertDropDownState();
}

class AppAlertDropDownState extends State<AppAlertDropDown> {
  @override
  Widget build(BuildContext context) {
    bool? isError = widget.isError;
    bool? isWarning = widget.isWarning;
    bool? isSuccess = widget.isSuccess;
    bool? isNeutral = widget.isNeutral;
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            color: isNeutral != null && !isNeutral
                ? Colors.grey[200]
                : isError != null && isError
                ? Colors.red
                : isWarning != null && isWarning
                ? Colors.amber
                : isSuccess != null && isSuccess
                ? Colors.green
                : Colors.green,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(width: 16.0),
                  // Image.asset(
                  //   isNeutral != null && !isNeutral
                  //       ? Assets.appImagesAlertDropdownNeutral
                  //       : isError != null && isError
                  //       ? Assets.appImagesAlertDropdownError
                  //       : isWarning != null && isWarning
                  //       ? Assets.appImagesAlertDropdownWarning
                  //       : isSuccess != null && isSuccess
                  //       ? Assets.appImagesAlertDropdownSuccess
                  //       : Assets.appImagesAlertDropdownNeutral,
                  //   height: 22.0,
                  //   width: 22.0,
                  // ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.errorMessage,
                          style: TextStyle(
                            fontSize: 16,
                            color: isNeutral != null && !isNeutral
                                ? Colors.white
                                : isError != null && isError
                                ? Colors.white
                                : isWarning != null && isWarning
                                ? Colors.white
                                : isSuccess != null && isSuccess
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                        Text(
                          widget.errorSubText ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: isNeutral != null && !isNeutral
                                ? Colors.white
                                : isError != null && isError
                                ? Colors.white
                                : isWarning != null && isWarning
                                ? Colors.white
                                : isSuccess != null && isSuccess
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(width: 16.0),
                  // Image.asset(
                  //   Assets.appImagesAlertDropdownClose,
                  //   width: 14.0,
                  //   height: 14.0,
                  //   color:
                  //       isNeutral != null && !isNeutral
                  //           ? context
                  //               .getCustomColorStyle()
                  //               .alertNeutralTextAndIcon
                  //           : isError != null && isError
                  //           ? context.getCustomColorStyle().error
                  //           : isWarning != null && isWarning
                  //           ? context
                  //               .getCustomColorStyle()
                  //               .alertWarningTextAndIcon
                  //           : isSuccess != null && isSuccess
                  //           ? context
                  //               .getCustomColorStyle()
                  //               .alertSuccessTextAndIcon
                  //           : context
                  //               .getCustomColorStyle()
                  //               .alertSuccessTextAndIcon,
                  // ),
                  const SizedBox(width: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

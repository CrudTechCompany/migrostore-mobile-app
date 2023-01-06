import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/privacy_policy_screen/privacy_policy_screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../setting_screen/settings_screen_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: Stack(
              children: [
                WebView(
                  zoomEnabled: false,
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: 'https://migrostore.pl/privacy-policy',
                  onWebViewCreated: (controller) {
                    context
                        .read<PrivacyPolicyScreenController>()
                        .setWebViewController(controller);
                  },
                  onPageFinished: (url) {
                    context
                        .read<PrivacyPolicyScreenController>()
                        .setLoadState();
                    context
                        .read<PrivacyPolicyScreenController>()
                        .webViewController
                        .runJavascriptReturningResult(
                            'document.getElementsByTagName("header")[0].style="display:none"');
                    context
                        .read<PrivacyPolicyScreenController>()
                        .webViewController
                        .runJavascriptReturningResult(
                            "document.getElementsByClassName('_title-block_16vyn_9')[0].style='display:none'");
                    context
                        .read<PrivacyPolicyScreenController>()
                        .webViewController
                        .runJavascriptReturningResult(
                            "document.getElementsByClassName('_chapter-block_t9c07_1')[0].style='margin-top:120px'");
                    context
                        .read<PrivacyPolicyScreenController>()
                        .webViewController
                        .runJavascriptReturningResult(
                            "document.getElementsByClassName('_chapter-block_32tio_1')[1].style='margin-bottom:20px'");
                    context
                        .read<PrivacyPolicyScreenController>()
                        .webViewController
                        .runJavascriptReturningResult(
                            "document.getElementsByTagName('footer')[0].style='display:none'");

                    context
                        .read<PrivacyPolicyScreenController>()
                        .webViewController
                        .runJavascript(
                            'document.getElementsByTagName("footer")[0].style="display:none"');
                  },
                ),
                context.watch<PrivacyPolicyScreenController>().loadState
                    ? Center(
                        child: SizedBox(
                          width: 40.0.w,
                          height: 40.0.w,
                          child: const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 144, 144, 144),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                ColoredBox(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  child: SizedBox(
                    width: 375.0.w,
                    height: 102.0.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 13.0.h,
                        left: 15.0.w,
                        right: 15.0.w,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () => context
                                  .read<SettingsScreenController>()
                                  .setPrivacyPolicyScreenState(),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              child: Icon(
                                Icons.arrow_back,
                                size: 24.0.w,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Політика конфіденційності",
                              style: GoogleFonts.roboto(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: const Color.fromARGB(255, 24, 24, 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

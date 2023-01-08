import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:migrostore/view/work_screen/work_screen_controller.dart';
import 'package:provider/provider.dart';

class WorkSelectSkillScreen extends StatelessWidget {
  const WorkSelectSkillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColoredBox(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: SizedBox(
            width: 375.0.w,
            height: 812.0.h,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.only(
                top: 117.0.h,
                bottom: 123.0.h,
                left: 15.0.w,
                right: 15.0.w,
              ),
              itemCount: context.read<WorkScreenController>().skillList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => context
                      .read<WorkScreenController>()
                      .onClickSkillListItem(index),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context
                              .read<WorkScreenController>()
                              .skillList
                              .keys
                              .toList()[index],
                          style: GoogleFonts.roboto(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            color: const Color.fromARGB(255, 24, 24, 24),
                          ),
                        ),
                        Icon(
                          context
                                  .watch<WorkScreenController>()
                                  .skillList
                                  .values
                                  .toList()[index]
                              ? Icons.radio_button_on
                              : Icons.radio_button_off,
                          size: 16.0.sp,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
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
                          .read<WorkScreenController>()
                          .setSelectSkillScreenState(),
                      child: Icon(
                        Icons.arrow_back,
                        size: 24.0.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Навички",
                      style: GoogleFonts.roboto(
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        color: const Color.fromARGB(255, 24, 24, 24),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ColoredBox(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: SizedBox(
              width: 375.0.w,
              height: 113.0.h,
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: context
                            .watch<WorkScreenController>()
                            .selectSkillButtonState
                        ? const Color.fromARGB(255, 24, 24, 24)
                        : const Color.fromARGB(255, 180, 180, 180),
                    borderRadius: BorderRadius.circular(30.0.r),
                  ),
                  child: SizedBox(
                    width: 345.0.w,
                    height: 53.0.w,
                    child: Center(
                      child: Text(
                        "Вибрати",
                        style: GoogleFonts.roboto(
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
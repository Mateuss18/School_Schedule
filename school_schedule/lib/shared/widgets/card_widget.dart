import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../tela_em_desenvolvimento.dart';

class CardWidget extends StatelessWidget {
  final String iconAsset;
  final String disciplinaName;
  final String primaryLabel;
  final String textIcon1Asset;
  final String textIcon2Asset;
  final String textIcon3Asset;
  final String secondaryLabel;
  final String thirdlyLabel;
  final Color color;
  final Function() onpressed;
  const CardWidget({
    Key? key,
    required this.iconAsset,
    required this.disciplinaName,
    required this.primaryLabel,
    this.textIcon1Asset = '',
    this.textIcon2Asset = '',
    this.textIcon3Asset = '',
    required this.secondaryLabel,
    required this.thirdlyLabel,
    required this.color,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: Container(
          height: 110,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.30),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(2, 3),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.centerRight,
                colors: [
                  color,
                  color.withOpacity(0.5),
                ],
              )),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                SvgPicture.asset(iconAsset),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                        disciplinaName,
                        const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                        '',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: _buildText(
                          primaryLabel,
                          const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          textIcon1Asset,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: _buildText(
                              secondaryLabel,
                              const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textIcon2Asset,
                            ),
                          ),
                          const SizedBox(
                            width: 11,
                          ),
                          _buildText(
                            thirdlyLabel,
                            const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            textIcon3Asset,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildText(String label, TextStyle style, String iconAsset) {
  return Row(
    children: [
      if (iconAsset != '')
        SvgPicture.asset(
          iconAsset,
          width: 17,
          height: 17,
          color: Colors.white,
        ),
      const SizedBox(
        width: 5,
      ),
      Text(
        label,
        style: style,
      ),
    ],
  );
}

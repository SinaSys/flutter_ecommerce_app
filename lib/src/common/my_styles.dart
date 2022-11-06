import 'my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_font_size.dart';

class MyStyle {
  static TextStyle regularText = TextStyle(
    fontSize: MyFontSize.text_14,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: MyColors.black,
  );

  static TextStyle pageTitle = TextStyle(
    fontSize: MyFontSize.text_24,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.creteRound().fontFamily,
  );

  static TextStyle productTitle = TextStyle(
    fontSize: MyFontSize.text_16,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle productPrice = TextStyle(
    fontSize: MyFontSize.text_12,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle productPriceDiscount = TextStyle(
    fontSize: MyFontSize.text_12,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle sectionTitle = TextStyle(
    fontSize: MyFontSize.text_20,
    fontWeight: FontWeight.w400,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle productDetailText = TextStyle(
    fontSize: MyFontSize.text_20,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle productDetailTitle = TextStyle(
    fontSize: MyFontSize.text_20,
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle productDetailPrice = TextStyle(
    fontSize: MyFontSize.text_16,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
    color: MyColors.primaryOrange,
  );

  static TextStyle productDetailDesc = TextStyle(
    fontSize: MyFontSize.text_14,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle productCartTitle = TextStyle(
    fontSize: MyFontSize.text_12,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
  );

  static TextStyle paymentMethodsTitle = TextStyle(
    fontSize: MyFontSize.text_20,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.inter().fontFamily,
  );
}

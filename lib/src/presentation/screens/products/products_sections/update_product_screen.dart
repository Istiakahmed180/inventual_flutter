import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventual/src/presentation/widgets/button/custom_elevated_button.dart';
import 'package:inventual/src/presentation/widgets/text_field/dropdown_form_field_section.dart';
import 'package:inventual/src/presentation/widgets/text_field/text_field_section.dart';
import 'package:inventual/src/presentation/widgets/toast/success_toast.dart';
import 'package:inventual/src/presentation/widgets/upload_image/upload_image.dart';

class UpdateProductScreen extends StatefulWidget {
  final dynamic product;

  const UpdateProductScreen({super.key, required this.product});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String categorySelectedValue = '';
  String brandSelectedValue = '';
  String unitSelectedValue = '';
  String taxSelectedValue = '';
  String taxMethodSelectedValue = '';
  String warehouseSelectedValue = "";

  List<String> categoryItems = ["Computer", "Television", "Shoes", "Fruits"];
  List<String> brandItems = ["Dell", "Acer", "Asus", "Hp", "Lenovo"];
  List<String> taxItems = ["12%", "11%", "10%", "9%", "8%"];
  List<String> taxMethodItems = ["Exclusive", "Non - Exclusive"];
  List<String> unitItems = ["Kilogram", "Meter", "Piece"];
  List<String> warehouseItems = ["Warehouse 1", "Warehouse 2", "Warehouse 3"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Edit Product",
                    style: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xFF444444),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 26,
                    color: Color(0xFF444444),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          const SizedBox(
            height: 20,
          ),
          UploadImage(image: widget.product["product-image"]),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                TextFieldSection(
                    label: "Product",
                    hint: widget.product["name"],
                    inputType: TextInputType.name),
                const SizedBox(
                  height: 20,
                ),
                DropdownFormFieldSection(
                    label: "Category",
                    hint: widget.product["category"],
                    items: categoryItems,
                    selectionItem: categorySelectedValue),
                const SizedBox(
                  height: 20,
                ),
                DropdownFormFieldSection(
                    label: "Brand",
                    hint: widget.product["Brand"],
                    items: brandItems,
                    selectionItem: brandSelectedValue),
                const SizedBox(
                  height: 20,
                ),
                DropdownFormFieldSection(
                    label: "Unit",
                    hint: widget.product["unit"],
                    items: unitItems,
                    selectionItem: unitSelectedValue),
                const SizedBox(
                  height: 20,
                ),
                DropdownFormFieldSection(
                    label: "Warehouse",
                    hint: widget.product["warehouse"],
                    items: warehouseItems,
                    selectionItem: warehouseSelectedValue),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextFieldSection(
                          label: "Product Code",
                          hint: widget.product["barcode"],
                          inputType: TextInputType.number),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xFFFCFCFC),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 1)),
                            child: SvgPicture.asset(
                              "assets/icons/icon_svg/barcode.svg",
                              width: 55,
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownFormFieldSection(
                    label: "Product Tax",
                    hint: widget.product["product-tax"],
                    items: taxItems,
                    selectionItem: taxSelectedValue),
                const SizedBox(
                  height: 20,
                ),
                DropdownFormFieldSection(
                  label: "Tax Method",
                  hint: widget.product["tax-method"],
                  items: taxMethodItems,
                  selectionItem: taxMethodSelectedValue,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: TextFieldSection(
                          label: "Product Price",
                          hint: widget.product["price"],
                          inputType: TextInputType.number),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFieldSection(
                          label: "Product Stock",
                          hint: widget.product["stock"],
                          inputType: TextInputType.number),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: CustomElevatedButton(
                      buttonName: "Update",
                      showToast: () {
                        SuccessToast.showSuccessToast(context, "Update Complete",
                            "Product Update Complete");
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

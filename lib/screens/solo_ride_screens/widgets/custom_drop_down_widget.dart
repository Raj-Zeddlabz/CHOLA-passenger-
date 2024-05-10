import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown1 extends StatelessWidget {
  final List<String> items;
  final String value;
  final ValueChanged<String?> onChanged;
  final Widget? prefixIcon;

  const CustomDropdown1({
    Key? key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.prefixIcon,
  }) : super(key: key);

  @override

  /// Builds a custom dropdown widget with the given context.
  ///
  /// The [context] parameter is the build context of the widget.
  /// Returns a [DropdownButtonFormField] widget that displays a dropdown menu
  /// with the given [items]. The [value] parameter is the currently selected
  /// item, and [onChanged] is a callback that is called when the selected item
  /// changes. The [prefixIcon] parameter is an optional icon to display before
  /// the dropdown menu.
  ///
  /// The dropdown menu is styled with an outlined border, filled background,
  /// and customized content padding. The height of each dropdown item is
  /// determined by the height of the screen and the font size is scaled based
  /// on the screen size.
  ///
  /// Returns a [DropdownButtonFormField] widget.
  Widget build(BuildContext context) {
    // Default value if the provided value is not in the items list
    final defaultValue = items.contains(value) ? value : items.first;

    return DropdownButtonFormField<String>(
      icon: Icon(
        Icons.keyboard_arrow_down_outlined,
        color: Colors.black,
      ),
      value: defaultValue,
      isExpanded: true,
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(20.r),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0.r),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.001,
        ),
      ),
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }
}

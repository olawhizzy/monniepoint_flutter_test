import 'package:flutter/material.dart';
import 'package:monniepoint_flutter_test/common.dart';

class FilterButton extends StatelessWidget {
  final IconData icon;
  final List<FilterOption>? filterOptions;
  final VoidCallback? onPressed;

  const FilterButton({
    Key? key,
    required this.icon,
    this.filterOptions,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (filterOptions != null && filterOptions!.isNotEmpty) {
      return _buildPopupMenuButton(context);
    } else {
      return _buildSimpleButton(context);
    }
  }

  Widget _buildPopupMenuButton(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: greyColor,
        shape: BoxShape.circle
      ),
      child: PopupMenuButton<String>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: Colors.white,
        elevation: 8,
        offset: Offset(0, -10),
        itemBuilder: (BuildContext context) {
          return filterOptions!.map((FilterOption option) {
            return PopupMenuItem<String>(
              value: option.value,
              child: _buildMenuItem(option),
            );
          }).toList();
        },
        onSelected: (String value) {
          print('Selected filter: $value');
        },
        child: _buildButtonChild(),
      ),
    );
  }

  Widget _buildSimpleButton(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: _buildButtonChild(),
        shape: CircleBorder(),
        elevation: 0.0,
        fillColor: greyColor,
      ),
    );
  }

  Widget _buildButtonChild() {
    return Icon(
      icon,
      color: Colors.white,
      size: 20,
    );
  }

  Widget _buildMenuItem(FilterOption option) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          option.label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Icon(
          option.icon,
          color: Colors.black,
          size: 20,
        ),
      ],
    );
  }
}

class FilterOption {
  final String label;
  final String value;
  final IconData icon;

  FilterOption({required this.label, required this.value, required this.icon});
}
import 'package:flutter/material.dart';
import '../export_casekarao.dart';

class MultipleSelectionToggleList extends StatelessWidget {
  final List<String> selectedItems;
  final Function(List<String>) onSelectionChanged;
  final List<String> categories;

  const MultipleSelectionToggleList({
    Key? key,
    required this.selectedItems,
    required this.onSelectionChanged,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context, i) => SizedBox(width: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedItems.contains(categories[index]);
          
          return GestureDetector(
            onTap: () {
              List<String> newSelection = List.from(selectedItems);
              if (isSelected) {
                newSelection.remove(categories[index]);
              } else {
                newSelection.add(categories[index]);
              }
              onSelectionChanged(newSelection);
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 15.0 : 0.0,
                right: index == categories.length - 1 ? 15.0 : 0.0,
              ),
              child: Container(
                width: 45,
                decoration: BoxDecoration(
                  color: isSelected
                      ? ColorManager.secondary
                      : ColorManager.kWhiteColor,
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3))],
                ),
                child: Center(
                  child: Text(
                    categories[index],
                    style: getmediumStyle(
                      fontSize: AppSize.s12,
                      color: isSelected
                          ? ColorManager.kWhiteColor
                          : ColorManager.kGreyColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

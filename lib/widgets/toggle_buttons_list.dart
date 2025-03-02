import 'package:flutter/material.dart';
import '../export_casekarao.dart';



class ToggleButtonList extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List? categories;

  const ToggleButtonList(
      {Key? key, this.selected, this.callback, this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context,i)=>SizedBox(width:8.0),
          scrollDirection: Axis.horizontal,
          itemCount: categories!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => callback!(index),
              child: Padding(
                padding:  EdgeInsets.only(left: index==0?15.0:0.0,right: index==6?15.0:0.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12,vertical: AppPadding.p18),
                  decoration: BoxDecoration(
                      color: selected == index
                          ? ColorManager.secondary
                          : ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.3)),
                      ]),
                  child: Center(
                    child: Text(categories![index],
                        style: getmediumStyle(
                          fontSize: AppSize.s12,
                          color: selected == index
                              ? ColorManager.kWhiteColor
                              : ColorManager.kGreyColor,
                        )),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

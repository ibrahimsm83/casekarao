import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../export_casekarao.dart';

class DocumentAttachmentSection extends StatefulWidget {
  final String title;
  final String? subtitle;
  final int maxAttachments;
  final Function(List<DocumentAttachment> attachments)? onAttachmentsChanged;

  const DocumentAttachmentSection({
    Key? key,
    this.title = 'Attach Document',
    this.subtitle,
    this.maxAttachments = 5,
    this.onAttachmentsChanged,
  }) : super(key: key);

  @override
  State<DocumentAttachmentSection> createState() => _DocumentAttachmentSectionState();
}

class _DocumentAttachmentSectionState extends State<DocumentAttachmentSection> {
  final List<DocumentAttachment> _attachments = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: getsemiboldStyle(
            color: ColorManager.primary,
            fontSize: ScreenUtil().setSp(AppSize.s16),
          ),
        ),
        if (widget.subtitle != null)
          Padding(
            padding: EdgeInsets.only( bottom: 0.h),
            child: Text(
              widget.subtitle!,
              style: getRegularStyle(
                color: ColorManager.kDarkGreyColor,
                fontSize: ScreenUtil().setSp(AppSize.s12),
              ),
            ),
          ),
        //SizedBox(height: 10.h),
        Container(
          width: AppSize.sizeWidth(context),
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
          decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
          child: Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: [
              ..._attachments.map((attachment) => _buildAttachmentItem(attachment)),
              if (_attachments.length < widget.maxAttachments)
                _buildAddButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAttachmentItem(DocumentAttachment attachment) {
    return Container(
       width: 68.w,
      height: 68.h,
      decoration: BoxDecoration(
        color: ColorManager.kWhiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: attachment.isImage
                ? Image.file(
                    attachment.file,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    ImageAssets.kDocumentsIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
          ),
          Positioned(
            top: 4.h,
            right: 4.w,
            child: InkWell(
              onTap: () {
                setState(() {
                  _attachments.remove(attachment);
                  if (widget.onAttachmentsChanged != null) {
                    widget.onAttachmentsChanged!(_attachments);
                  }
                });
              },
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: ColorManager.kWhiteColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.kGreyColor.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 14.sp,
                    color: ColorManager.kDarkGreyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: _pickDocument,
      child: Container(
         width: 68.w,
      height: 68.h,
        decoration: BoxDecoration(
          color: ColorManager.kGreyBackViewColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 30.sp,
            color: ColorManager.kGreyColor,
          ),
        ),
      ),
    );
  }

  void _pickDocument() async {
    // This is where you would implement file picking functionality
    // For demonstration purposes, we'll just add a dummy document
    if (_attachments.length < widget.maxAttachments) {
      setState(() {
        _attachments.add(
          DocumentAttachment(
            name: 'Document ${_attachments.length + 1}',
            isImage: false,
          ),
        );
        
        if (widget.onAttachmentsChanged != null) {
          widget.onAttachmentsChanged!(_attachments);
        }
      });
    }
  }
}

class DocumentAttachment {
  final String name;
  final bool isImage;
  final dynamic file; // This would be a File in a real implementation

  DocumentAttachment({
    required this.name,
    this.isImage = false,
    this.file,
  });
}

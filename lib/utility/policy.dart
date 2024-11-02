


class DMSPolicy{

  static const double maxAttachmentVideoLimit = 1;

  static const int maxRecordDuration = 30000;

  static const double maxAttachmentLimit = 3;

  static bool isLimitExceed(int value){
    return value == maxAttachmentLimit;
  }

  static bool isLimitExceedVideo(int value){
    return value == maxAttachmentVideoLimit;
  }


}
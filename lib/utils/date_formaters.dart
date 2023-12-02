class DateFormatters{


   static String toMonthWord(DateTime dateTime){
    switch(dateTime.month){
      case DateTime.january : return "Jan";
      case DateTime.february : return "Feb";
      case DateTime.march : return "Mar";
      case DateTime.april : return "Apr";
      case DateTime.may : return "May";
      case DateTime.june : return "Jun";
      case DateTime.july : return "Jul";
      case DateTime.august : return "Aug";
      case DateTime.september : return "Sept";
      case DateTime.october : return "Oct";
      case DateTime.november : return "Nov";
      case DateTime.december : return "Dec";
      default : return "Select valid month";

    }
  }

  static String getWordDate (DateTime dateTime){
     return "${toMonthWord(dateTime)} ${dateTime.year}";
  }
}
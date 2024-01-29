import 'package:intl/intl.dart';

class DateFormatters{


   static String toMonthShortWord(DateTime dateTime){
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

   static String toMonthFullWord(DateTime dateTime){
     switch(dateTime.month){
       case DateTime.january : return "January";
       case DateTime.february : return "February";
       case DateTime.march : return "March";
       case DateTime.april : return "April";
       case DateTime.may : return "May";
       case DateTime.june : return "June";
       case DateTime.july : return "July";
       case DateTime.august : return "August";
       case DateTime.september : return "September";
       case DateTime.october : return "October";
       case DateTime.november : return "November";
       case DateTime.december : return "December";
       default : return "Select valid month";

     }
   }

  static String getWordDate (DateTime dateTime){
     return "${toMonthShortWord(dateTime)} ${dateTime.year}";
  }

  static String getFullDate (DateTime dateTime){
     return DateFormat.yMMMMd('en_US').format(dateTime);
  }
  
  static String getHMTime(DateTime dateTime){
     return DateFormat("HH:mm").format(dateTime);
  }

  static String getDayMonthYear(DateTime dateTime){
     return DateFormat("dd MMMM yyyy").format(dateTime);
  }
}
use Date::MMDDYY;

$date = time();

$date1 = datecon($date);

print "No extra paramters given                         : $date1\n";

$date2 = datecon($date, "MM,YY", "/");

print "Only print Month and Year with a / as delemiter  : $date2\n";

$date3 = datecon($date, "", "_");

print "Use default format, except with a _ as delemiter : $date3\n";

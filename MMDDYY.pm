package Date::MMDDYY;

# Date::MMDDYY module, version 1.00

require 5.000;
require Exporter;

our @ISA = (Exporter);
our @EXPORT = qw(datecon);
our $VERSION = 1.00;

sub datecon {

	$temp_time = gmtime($_[0]);
	@time_array = split(/\s+/, $temp_time);

	$temp_day = $time_array[2];
	$temp_month = $time_array[1];
	$temp_year = $time_array[4];

	if ($temp_month =~ /^Jan/) {
		$month = "01";
		}
	elsif ($temp_month =~ /^Feb/) {
		$month = "02";
		}
	elsif ($temp_month =~ /^Mar/) {
		$month = "03";
		}
	elsif ($temp_month =~ /^Apr/) {
		$month = "04";
		}
	elsif ($temp_month =~ /^May/) {
		$month = "05";
		}
	elsif ($temp_month =~ /^Jun/) {
		$month = "06";
		}
	elsif ($temp_month =~ /^Jul/) {
		$month = "07";
		}
	elsif ($temp_month =~ /^Aug/) {
		$month = "08";
		}
	elsif ($temp_month =~ /^Sep/) {
		$month = "09";
		}
	elsif ($temp_month =~ /^Oct/) {
		$month = "10";
		}
	elsif ($temp_month =~ /^Nov/) {
		$month = "11";
		}
	elsif ($temp_month =~ /^Dec/) {
		$month = "12";
		}
	else {
		$month = "13";
		}

	if ($temp_day < 10) {
		$day = "0$temp_day";
		}
	else {
		$day = $temp_day;
		}

	$temp_year =~ s/^\d{2}//;
	$year = $temp_year;

	if ($month == 13) {
		$mmddyy = "Error";
		}
	else {
		$mmddyy = "$month-$day-$year";
		}		

	return $mmddyy

	}

1;

__DATA__

=head1 NAME

Date::MMDDYY - Converts a epoch time format string to MM-DD-YY

=head1 EXAMPLE

 use Date::MMDDYY;
 
 $time_string = time();
 $date = datecon($time_string);	

=head1 DESCRIPTION

Date::MMDDYY is used for quick conversions of a time(); format string to 
a MM-DD-YY type string.

=head1 USAGE

This is simple, just do the following:

datecon($time_string);

Where $time_string contains the output of the time(); function,
or a epoch time stamp. It will then return the date in the MM-DD-YY format.

=head1 AUTHOR

Glenn E. Bailey III <replicant@napalm.net>

=head1 COPYRIGHT

Copyright (c) 2001 Glenn E. Bailey III. All rights reserved.
This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself. 

package Date::MMDDYY;

# Date::MMDDYY module, version 1.10

require 5.000;
require Exporter;

our @ISA = (Exporter);
our @EXPORT = qw(datecon);
our $VERSION = 1.10;

sub datecon {

	$temp_time = gmtime($_[0]);

	@format = split(/,/, $_[1]);
        if (! @format) {
                @format = ("MM", "DD", "YY");
                }
	
	$delem = "$_[2]";
	if (! $delem) {
		$delem = "-";
		}


	@time_array = split(/\s+/, $temp_time);

	$temp_day = $time_array[2];
	$temp_month = $time_array[1];
	$temp_year = $time_array[4];

	undef @final_date;

	for (@format) {
	
		if ($_ =~ /^MM/) {
			if ($temp_month =~ /^Jan/) {
				push(@final_date, "01");
				}
			elsif ($temp_month =~ /^Feb/) {
				push(@final_date, "02");
				}
			elsif ($temp_month =~ /^Mar/) {
				push(@final_date, "03");
				}
			elsif ($temp_month =~ /^Apr/) {
				push(@final_date, "04");
				}
			elsif ($temp_month =~ /^May/) {
				push(@final_date, "05");
				}
			elsif ($temp_month =~ /^Jun/) {
				push(@final_date, "06");
				}
			elsif ($temp_month =~ /^Jul/) {
				push(@final_date, "07");
				}
			elsif ($temp_month =~ /^Aug/) {
				push(@final_date, "08");
				}
			elsif ($temp_month =~ /^Sep/) {
				push(@final_date, "09");
				}
			elsif ($temp_month =~ /^Oct/) {
				push(@final_date, "10");
				}
			elsif ($temp_month =~ /^Nov/) {
				push(@final_date, "11");
				}
			elsif ($temp_month =~ /^Dec/) {
				push(@final_date, "12");
				}
			}
		elsif ($_ =~ /^DD/) {
			if ($temp_day < 10) {
				push(@final_date, "0$temp_day");
				}
			else {
				push(@final_date, "$temp_day");
				}
			}

		elsif ($_ =~ /^YY/) {
			$temp_year =~ s/^\d{2}//;
			push(@final_date, $temp_year);
			}
		}


	if (! @final_date) {
		$mmddyy = "Error";
		}
	else {
		$mmddyy = join "$delem", @final_date;
		}


	return $mmddyy;

	}

1;

__DATA__

=head1 NAME

Date::MMDDYY - Converts a epoch time format string to MM-DD-YY

=head1 EXAMPLES

 use Date::MMDDYY;
 
 $time_string = time();
 $date = datecon($time_string);	

 or 

 $date = datecon("$time_string", "MM,YY", "/");

 or 

 $date = datecon("$time_string", "", "_");

 or 

 $date = datecon("$time_string", "MM,DD", "");

=head1 DESCRIPTION

Date::MMDDYY is used for quick conversions of a time(); format string to 
a MM-DD-YY type string.

=head1 USAGE

datecon("$time_string", "$format", "$delemiter");

$time_string contains the output of the time(); function,
or an epoch time stamp. 

$format should be a comma seperated list of the variables you want 
(no spaces). Accepted are MM for month, DD for day, and YY for year.
They should be in the order you want them output as. If you want the
default (MM,DD,YY) just provide blank quotes, otherwise you will 
receive an error.
 
$delemiter should contain, well, what you want to use as the 
delemiter. If nothing is provided, "-" will be used as default.


If you just want the standard MM-DD-YY output you just just provide
the $time_string and nothing else.

=head1 AUTHOR

Glenn E. Bailey III <gbailey@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2001 Glenn E. Bailey III. All rights reserved.
This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself. 

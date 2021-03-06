#!/usr/bin/perl

################################################################################
#
# This is the template song file for writing beep songs.
#
# 1.  Copy this file and re-name it to a file name of your choice.
#	Keep your new file in the songs/ directory.
# 2.  Modify the value passed into set_tempo().  This is tempo that the song 
#	will play at in BPM (Beats Per Minute).  If you don't know what to 
#	set it to, leave it at 115 and adjust accordingly during or after
#	writing the song.
# 3.  Write your song.  You want to start modifying the contents after the line:
#        my $song = join (":", <<SONG =~  /(.+)/g);
#
#    Here is how it works:  
#       To form a note, here is the general syntax:
#	$length $note -n
#	
#	So lets say you want to play a C quarter note:
#	$quarter $CN4 -n 
#	
#	This means play a quater note, with the note being a C Natural in the 4th
#	ocatve.  I believe $CN4 is Middle C on the keyboard for reference.
#	You have all the way from octave 0 to octate 8.  Although I don't know the
#	frequencies beyond $Eb8, so that's the highest you can get for now.  
#	
#	Sharps are indicated by a 'S' in the 2nd characterof the variable.  
#	Flats are indicated by a 'b' in the 2nd character of the variable.
#	Notes with an equivilant sharp and flat (ex:  $DS5 and $Eb4) are set
#	to the same frequency, thus they are the same note. 
#	
#
#	IMPORTANT NOTES (pun somewhat intended) :
#	The length must come before the note. 
#	You MUST have a space after each -n .  Otherwise the song won't play right.
#	You MUST NOT have a -n on the last note of the song.  Otherwise you will
#		get an unintentional default beep at the end of the song.
#
#	Rest Notes:  
#	These are a bit tricky, as I don't have a way right now to play rest notes
#	by themselves.  So if you want a quarter note rest for example, you need
#	to use the $quarter_rest on the note before the rest should occur.  Here is 
#	small song that plays a C quarter note on beats 1 and 3, but rests on beat's
#	2 and 4:
#
#	$quarter $CN4 $quarter_rest -n 
#	$quarter $CN4 $quarter_rest
#
#	
#	Reference:  Here is list of lengths that you can use:
#	NOTES:
#
#	Whole Note:                                  $whole
#	Dotted Half Note:                            $dottedhalf
#	Half Note with a slide to an Eighth Note:    $half_slide_eighth
#	Half Note with a slide to a Sixteenth Note:  $half_slide_sixteenth
#	Half Note:                                   $half	
#	Dotted Quarter Note:                         $dottedquarter
#	Quarter Note:                                $quarter
#	Eighth Note:                                 $eighth
#	Sixteenth Note:                              $sixteenth
#
#	RESTS:
#		
#	Whole Rest:                                  $whole_rest
#	Dotted Half Rest:                            $dottedhalf_rest
#	Half Note with a slide to an Eighth Rest:    $half_slide_eighth_rest
#	Half Note with a slide to a Sixteenth Rest:  $half_slide_sixteenth_rest
#	Half Rest:                                   $half_rest	
#	Dotted Quarter Rest:                         $dottedquarter_rest
#	Quarter Rest:                                $quarter_rest
#	Eighth Rest:                                 $eighth_rest
#	Sixteenth Rest:                              $sixteenth_rest
#       
#	
# 
#     
################################################################################

################################################################################ 
# BEGIN HOUSEKEEPING.  DON'T MODIFY ANYTHING IN THIS SECTION.
################################################################################ 
open (CONFIG_FILE, "/etc/beepbeep.conf");

my @records = <CONFIG_FILE>;
my $record = "";

foreach $record (@records) {
        chomp ($record);

        if ($record =~ m/^(install_path)(=)(.*)/) {
                $install_path = $3;
                $install_path =~ tr/\"//d;
        }
}

close (CONFIG_FILE);

require "$install_path/notes.pl";
################################################################################ 
# END HOUSEKEEPING. 
################################################################################ 


################################################################################ 
# Set the tempo here:
################################################################################ 
set_tempo (115);
################################################################################ 
# End tempo section.
################################################################################ 


################################################################################ 
# Begining of song.  Don't modify this line below:
################################################################################ 
my $song = join (":", <<SONG =~  /(.+)/g);
################################################################################ 
# End of perl song definition.
################################################################################ 

################################################################################ 
# Being your song here.  See comments at top on how to write the notes.
################################################################################ 
    $dottedquarter $EN5 $super_small -n 


SONG
    `beep $song`;


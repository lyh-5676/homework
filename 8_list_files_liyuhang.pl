#!/usr/bin/perl
#   Demonstrating how to open a folder and list its contents

use strict;
use warnings;

my @files = (  );
my $folder = '.';

# Open the folder
unless(opendir(FOLDER, $folder)) {
    print "Cannot open folder $folder!\n";
    exit;
}

# Read the folder, ignoring special entries "." and ".."
@files = grep (!/^\.\.?$/, readdir(FOLDER));

closedir(FOLDER);


# If file, print its name
# If folder, print its name and contents
#
# Notice that we need to prepend the folder name!



foreach my $file (@files) {

    # If the folder entry is a regular file
    if (-f "$folder/$file") {
        print "$folder/$file\n";

    # If the folder entry is a subfolder
    }elsif( -d "$folder/$file") {

        my $folder = "$folder/$file";

        # open the subfolder and list its contents
        unless(opendir(FOLDER, "$folder")) {
            print "Cannot open folder $folder!\n";
            exit;
        }
        
        my @files = grep (!/^\.\.?$/, readdir(FOLDER));
        
        closedir(FOLDER);
        
        foreach my $file (@files) {
            print "$folder/$file\n";
        }
    }
}

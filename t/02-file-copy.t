use v6;
use Test;
use File::Copy;
use File::Find;

cp 't/test.file', 't/another.file', :r;
is slurp('t/test.file'),
   slurp('t/another.file'),
   "copied file is identical";
cp 't/dir1', 't/dir2', :r;
is dir('t/dir1'),
   dir('t/dir2'),
   "recursive copy";
unlink 't/another.file';
my @filelist := find(dir => 't/dir2');
for @filelist.reverse -> $file { say $file; unlink $file; }
unlink 't/dir2';
done;

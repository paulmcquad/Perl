#!/usr/bin/perl

# Connect to a Web Server

print "Content-type: text/html\n\n";

use IO::Socket;
 
my $sock = IO::Socket::INET->new
(
 Proto      => "tcp",
 PeerAddr   => "coder-forge.com",
 PeerPort   =>  80
);

$sock->autoflush(1);

print $sock "GET /resources.html HTTP/1.0\015\012\015\012";

open(FILE, ">IOSocket.txt");
while (<$sock>) {
    print FILE;
    }
    close(FILE);


  use Net::CIDR;
  use Net::CIDR ':all';
  my $var;
  if ($var = Net::CIDR::cidrvalidate($var))
  {
       // ... do something
  }
  print join("\n",
        Net::CIDR::range2cidr("192.168.0.0-192.168.255.255",
                "10.0.0.0-10.3.255.255"))
      . "\n";

  print Net::CIDR::addrandmask2cidr("195.149.50.61", "255.255.255.248")."\n";
The following modules are required for this chapter:

* DateTime
* DateTime::Format::Strptime
* Exporter::NoWork
* Moose
* Moose::Util::TypeConstraints
* MooseX::StrictConstructor
* Test::Class
* Test::Most
* URI::Encode
* namespace::autoclean

Individual test programs in the t/ directory should be run with:

 prove -lv t/test_name.t

You can run the entire test suite with:

 prove -l t/

See "perldoc prove" for more information.

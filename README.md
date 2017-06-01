67272 Chess Store Project
===

This is my final project for 67-272 taught at CMU. We were expected to create a webapp for a chess store specializing in supplying large orders to schools. For this phase of the project we were provided models and some of basic cart functions in the starter code, however we were required to create our own implementation of these models in previous phases of the project.

You will need to run `bundle install` to get the needed testing gems. You can populate the development database with realistic data by running `rake db:populate`.  All passwords are 'secret' in the system for all users. The list of known users include (username, role): 

- Mark ('mark', admin)
- Alex ('tank', admin)
- Karen ('kirvine', customer)
- Ben  ('bjunker', customer)
- Israel ('imadueme', customer)
- Mark V ('mvella', customer)
- Melanie ('melfree', customer)
- Rick ('rhuang', manager)
- Becca  ('bkern', manager)
- Connor ('chanley', shipper)
- Sarah ('srf', shipper)

There are other 40 customers randomly generated in the system along with 45 schools.  The known customers should have 3-5 orders each and 20 other random customer/school combinations will also have placed orders. (Five of those orders have been placed either today or the day before and haven't been shipped yet, so shipper list will have some items to ship.)



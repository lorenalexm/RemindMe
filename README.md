# RemindMe!
[![Build Status](https://travis-ci.org/lorenalexm/RemindMe.svg?branch=master)](https://travis-ci.org/lorenalexm/RemindMe)

A basic SMS service that receives and parses reminder requests, issuing a reply in turn at the requested time. Built on [Ruby](https://www.ruby-lang.org) using [Sinatra](http://www.sinatrarb.com), [Sidekiq](http://sidekiq.org), ActiveRecord, and [Twilio](https://www.twilio.com) to handle the SMS service.


### Description
This was built out of frustration of constantly receiving messages from friends to either remind them of something or even more simply, a message for them to review at a later time. Hence RemindMe! was born, providing a number/service for anyone to message and have a kindly reminder sent to them at a later time.

RemindMe! accepts messages taking the following forms, trying to be as versatile as possible by offering a default time if one can not be found.
* _in 5 minutes to wash the dishes_
* _at 5pm to cook dinner_
* _on Monday to get ready for work_
* _take the dogs for a walk_ (Defaulting to three hours from now)

### Tech reasoning
[Sidekiq](http://sidekiq.org) is used heavily for its proven ability to not only process background jobs, but to be able to schedule future jobs without the need to require any additional gems.

Even though [Rails](http://rubyonrails.org) is considered to be one of the standards, and I could really use some more experience with it, I chose to use [Sinatra](http://www.sinatrarb.com) as the requirements of RemindMe! are truly very minimal; and the extra niceties provided in Rails are rather overkill.

ActiveRecord was chosen over DataMapper, the only other ORM I have experience with, as I am still learning Rails and wish to carry over what little of that knowledge I already have.

[Twilio](https://www.twilio.com) for the simple reason that at the time RemindMe! was started I had not heard of any alternatives, the cost was reasonable, and as previously stated: it was the only service I knew of.

### TODO list
* Render the core functionality usable
* Incorporate Sprockets as an asset-pipeline
* Develop a frontend that will __hopefully__ not cause eye-bleeding
* Reminder listing by phone number, accessed via 'two-factor authentication'
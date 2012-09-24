## Contenteditable


Contenteditable helps to integrate an easy CRM system to provide a client an opportunity editing content on a website.

* This is a lite version, it's easy connectable to an app
* Generates a table to keep the data
* Uses contenteditable HTML5 tag


## Installation

### Install gem

>gem "contenteditable", :github => 'micmmakarov/contenteditable_lite'

>bundle install

### Run install script

>rails generate contenteditable:install

### Generate table

>rake db:migrate

## Use

### Use simple tags in views

after BODY tag add:
> <%= save_button %>
to use build-in save button or alternatively use "contenteditable_save_button" class if you want to make a button on your own


In the view, where it's supposed to be contenteditable
><%= ceditable("title", "h1") %>

or

><%= ceditable("title", "h1", {:class => 'green'}) %>

where "title" should be a unique key, for example "front page tagline" or "about description"
 
### Configure access

application controller:

contenteditable_filter :autintificate_admin!

this is an analog of "before_filter" if you use devise. Editable interface will be only provided to admins in this case.


### Enjoy

First version must be buggy. Fix it if you find!

Enjoy!


Under MIT license

## Contenteditable


Contenteditable helps to integrate easy CRM system to provide client an opportunity editing content on a website.

* This is lite version, it's easy connectable to an app
* Generates a table to keep the data
* Uses contenteditable HTML5 tag


## Installation

### Install gem

gem "contenteditable", :github => 'micmmakarov/contenteditable_lite'

bundle install

### Generate table

rails install:contenteditable:migrations

rake db:migrate

### Setup views 

To the head of layouts/application view: <%=  contenteditable_assets %>
after <body> tag: <%= save_button %>



In the view, where it's supposed to be contenteditable
<%= ceditable("title", "h1") %>

or

<%= ceditable("title", "h1", {:class => 'green'}) %>


 
### Configure access

application controller:

contenteditable_filter :autintificate_admin!

this is an analog of "before_filter" if you use devise. Editable interface will be only provided to admins in this case.


### Enjoy

First version must be buggy. Fix it if you find!

Enjoy!


Under MIT license

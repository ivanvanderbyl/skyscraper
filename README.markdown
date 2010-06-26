SkyScraper
==========

Scrapes data from websites into your database.
--

p. **Goals of this project:**

* Easy to write intuitive DSL
* Run from command line as rake task/crontab
* Duplicate content detection
* Association mapping
* Nokogiri CSS selectors
* Easy attribute assignment
* Page scopes

p. *Proposed DSL syntax*

<pre>
  <code>
    scraper do
      page('http://someurl.com/articles/101')
      page('http://someurl.com/articles/102')
      page('http://someurl.com/articles/103')

      context(Page) do
        title css('h1.title')
        body css('p.body')
        
        context(Comment) do
          author css('.comment .author')
          message css('.comment .body')
          posted_at css('.comment time').parse_date
        end
      end
    end
  </code>
</pre>

p. This would create a new record for each page and fill the title and body attributes of the Page model, and then iterate over each comment and create a new record for Page.{instance}.comments association.

Note on Patches/Pull Requests
===
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

--
Copyright (c) 2010 Ivan Vanderbyl. See LICENSE for details.

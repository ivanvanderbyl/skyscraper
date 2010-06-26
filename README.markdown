SkyScraper
==========

Scrapes data from websites into your database.

**Goals of this project:**

* Easy to write intuitive DSL
* Run from command line as rake task/crontab
* Duplicate content detection
* Association mapping
* Nokogiri CSS selectors
* Easy attribute assignment
* Page scopes

**Proposed DSL syntax**

    site("News.com.au") do
      page('http://www.news.com.au/breaking-news')
      page('http://www.news.com.au/world')

      Page.scrape do
        title css('#section-header-logo h1')

        articles.scrape do
          title css('div.story-block h4.heading')
          body css('p.body')
        end
      end
    end
    


This would create a new record for each page and fill the title, then iterate over each article and create another record with the title and body populated from the css scope.

Note on Patches/Pull Requests
===
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.


**Copyright (c) 2010 Ivan Vanderbyl. See LICENSE for details.**

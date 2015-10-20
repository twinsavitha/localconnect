Given /^I am on the blog homepage$/ do
 visit("/posts")
end

When /^I click "New Post" link$/ do
 click_on "New Post"
end

When /^I fill "(.*?)" as Title$/ do |title|
 @title = title
 fill_in "Title", :with => title
end

When /^I fill "(.*?)" as content$/ do |content|
 fill_in "Content", :with => content
end

When /^I click "(.*?)" button$/ do |btn|
 click_button btn
end

Then /^I should see the blog I just posted$/ do
 page.should have_content(@title)
end


And /^there are already (\d) posts$/ do |count|
  count.to_i.times do |n|
    Post.create!({ :title => "Title #{n}", :content => "Content #{n}"})
  end
end


Then /^I can see list of (\d) posted blogs$/ do |count|
	page.should have_selector("table#posts-list>tr:eq(#{count})")
end
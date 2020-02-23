When("I visit {string}") do |url|
  visit(url)
end

When("I click {string}") do |identifier|
  find(identifier).click
end

When("I click the link {string}") do |link_text|
  find('a', text: link_text).click
end

When("I enter {string} into {string}") do |value, field|
  fill_in field, with: value
end

Then("I expect to see {string}") do |content|
  expect(page).to have_content(content)
end

Then("I cannot see {string}") do |content|
  expect(page).to have_no_content(content)
end

When("I select {string} from {string}") do |value, select|
  find(select).find('option', text: value).select_option
end

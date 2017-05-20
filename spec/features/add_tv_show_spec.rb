require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do
  # visit add new show page
  visit "/television_shows/new"
  # The user fills in each space with information about their TV Show
  fill_in('Title', with: 'WWE Raw')
  fill_in('Network', with: 'USA')
  fill_in('Starting Year', with: '1990')
  select('Action', from: 'Genre')
  fill_in('Synopsis', with: "See your favorite WWE Superstars battle every Monday night!")
  click_button('Add TV Show')
  # expect page to have the above content
  expect(page).to have_content("WWE Raw (USA), 1990, Action")
end

  scenario "fail to add a show with invalid information" do
    # visit the add new show page
    visit "/television_shows/new"
    # The user just clicks on add new show without filling any information
    click_button('Add TV Show')

    expect(page).to have_content(" Title can't be blank
    Starting year can't be blank
    Starting year is not a number")

  end

end

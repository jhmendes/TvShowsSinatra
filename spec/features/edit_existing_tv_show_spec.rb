require "spec_helper"
# As a TV fanatic
# I want to edit an existing show
# So that I can correct any foolish mistakes
#
# Acceptance Criteria:
# * Editing a show provides a pre-populated form for each field.
# * Submitting the edit form will update a show if all validations pass.
# * The user is redirected to the details page for that show if successfully updated.
# * If the update fails any validations, re-display the form with the appropriate error messages.
feature "user edits an existing TV show" do

  scenario "successfully edits an existing show" do
    # create sample TV Show
    family_guy = TelevisionShow.create!({
        title: "Family Guy", network: "TBS",
        starting_year: 2011, ending_year: 2017, genre: "Comedy",
        synopsis: "Everyone Loves Family Guy"
      })
    # click on button/link to edit the show
    visit "/television_shows"
    click_link("Family Guy (TBS), 2011, Comedy")
    click_link('Edit Show Information')
    # user fills in new information
    fill_in('Network', with: 'Comedy Central')
    # user clicks on the update button to submit information
    click_button("Update")
    # the page should be updated with the new information
    expect(page).to have_content("Family Guy Network: Comedy Central Years: 2011 - 2017 Genre: Comedy Everyone Loves Family Guy")

  end


end

require "spec_helper"

feature "user views list of TV shows" do
  # As a TV fanatic
  # I want to view a list of TV shows
  # So I can find new shows to watch
  #
  # Acceptance Criteria:
  # * I can see the names and networks of all TV shows

  scenario "view list of TV shows" do
    # First create some sample TV shows
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      })

    married_with_children = TelevisionShow.create!({
        title: "Married... with Children", network: "Fox",
        starting_year: 1987, ending_year: 1997,
        genre: "Comedy"
      })

    # The user visits the index page
    visit "/television_shows"

    # And should see both TV shows listed (just the title and network)
    expect(page).to have_content("Game of Thrones (HBO)")
    expect(page).to have_content("Married... with Children (Fox)")
  end

  # As a TV fanatic
  # I want to view the details for a TV show
  # So I can find learn more about it

  # Acceptance Criteria:
  # * I can see the title, network, start and end year, genre, and synopsis
  #   for a show.
  # * If the end year is not provided it should indicate that the show is still
  #   running.

  scenario "view details for a TV show" do
    # first create a sample tv show
    family_guy = TelevisionShow.create!({
        title: "Family Guy", network: "TBS",
        starting_year: 2011, ending_year: 2017, genre: "Comedy",
        synopsis: "Everyone loves Family Guy."
      })
      # visit the home page
      visit "/television_shows"
      # the user clicks on the link of their chosen show to view the details of that show
      click_link("Family Guy (TBS), 2011, Comedy")
      # should see the information about the show displayed
    expect(page).to have_content("Family Guy Network: TBS Years: 2011 - 2017 Genre: Comedy Everyone loves Family Guy")

  end


  scenario "view details for a TV show with missing information" do
    # create sample TV show with missing information
    game_of_thrones = TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO", starting_year: 2011,
        genre: "Fantasy"
      })
      # visit the home page
      visit "/television_shows"
      # the user clikcs on the link for the show with the missing information
      click_link("Game of Thrones (HBO), 2011, Fantasy")
      # the user should see the shows information but some of the info is missing
      expect(page).to have_content("Game of Thrones Network: HBO Years: 2011 - (Still on air) Genre: Fantasy")

  end
end

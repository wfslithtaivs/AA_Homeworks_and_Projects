require 'rails_helper'

RSpec.feature "Auths", type: :feature do

  feature "the signup process" do

    scenario "has a new user page" do
      visit new_user_url
      expect(page).to have_content "New User"
    end

    feature "signing up a user" do
      before(:each) do
        visit new_user_url
        fill_in 'Email', with: "kelly@hashbrown.com"
        fill_in 'Password', with: "hashbrownhashbrownhashbrown"
        click_on "create_user"
      end

      scenario "shows username on the homepage after signup" do
        expect(page).to have_content "kelly@hashbrown.com"
      end
    end
  end

  feature "logging in" do
    before(:each) do
      visit new_session_url
      fill_in 'Email', with: "kelly@hashbrown.com"
      fill_in 'Password', with: "hashbrownhashbrownhashbrown"
      click_on 'sign_in'
    end

    scenario "shows username on the homepage after login" do
      expect(page).to have_content 'Hi kelly@hashbrown.com so happy to see you today!'
    end
  end

  feature "logging out" do
    before(:each) do
      visit users_url
      click_on 'sign_out'
    end

    scenario "begins with a logged out state" do
      expect(page).to have_content 'bye bye, you have logged out see you next time'
    end

    scenario "doesn't show username on the homepage after logout" do
      expect(page).not_to have_content 'kelly@hashbrown.com'
    end

  end
end

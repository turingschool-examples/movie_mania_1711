require 'rails_helper'

   describe 'admin sees award index and form to create a new award'  do
     it 'after creating award they click submit and sees all awards' do
       user = User.create(username: "kyle", password: "password", role: 1)

       allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

       visit awards_path

       expect(page).to have_content("Create new award")

     end
   end

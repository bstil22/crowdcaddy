class WelcomeController < ApplicationController
  before_action do
    @user = current_user
  end
 def index
 end
end
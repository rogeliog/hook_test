class CommitsController < ApplicationController
  respond_to :json
  def create
    begin
      commit = Commit.new.updated_attributes_from_hook(params['commits'])
      if commit.save!
        respond_with success: true
      else
        respond_with nothing: true
      end
    rescue
      puts '[Debbug] Commit parse error'
    end
  end

end

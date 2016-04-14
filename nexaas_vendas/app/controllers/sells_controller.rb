class SellsController < ApplicationController
  def index
  end

  def import
  end

  def upload
    uploaded_io = params[:tab_file]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    redirect_to action: :index
  end
end

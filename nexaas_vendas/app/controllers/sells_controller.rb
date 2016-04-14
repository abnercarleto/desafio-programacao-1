class SellsController < ApplicationController
  def index
    @sell_items = SellItem.all_realized
  end

  def import
  end

  def upload
    uploaded_io = params[:tab_file]
    file_name = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    SellParser.new(file_name).parse

    redirect_to action: :index
  end
end

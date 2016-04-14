class SellsController < ApplicationController
  def import
  end

  def upload
    uploaded_io = params[:tab_file]
    file_name = Rails.root.join('public', 'uploads', uploaded_io.original_filename)
    File.open(file_name, 'wb') do |file|
      file.write(uploaded_io.read)
    end

    import_uuid = SellParser.new(file_name).parse
    @summary = Summary.new(import_uuid)
  end
end

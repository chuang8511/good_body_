require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

class RecordSetsDeleteController < ApplicationController

  def delete_record
      sets_record = SetsRecord.find(params[:id])
      sets_record.destroy
      redirect_to sets_page_path
  end

end

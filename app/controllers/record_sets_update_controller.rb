require 'uri'
require 'net/http'
require_relative '../domain_models/common_error'

# 點選 Update 跳到可輸入環節？ # 需要重新討論流程

class RecordSetsUpdateController < ApplicationController

    id      = params[:id]
    content = params[:content]
    set     = params[:set]
    rep     = params[:rep]
    weight  = params[:weight]

    record_sets_update = RecordSetsUpdate.new(id, content, set, rep, weight)


    begin

        if record_sets_update.update_set_record
            render :index
        end

    rescue NoContentError
        flash.now[:error] = 'Content is wrong. Please re-enter your content.'
        render :index

    rescue NoSetError
        flash.now[:error] = 'Set is wrong. Please re-enter your set.'
        render :index

    rescue NoRepError
        flash.now[:error] = 'Rep is wrong. Please re-enter your Rep.'
        render :index

    rescue NoWeightError
        flash.now[:error] = 'Weight is wrong. Please re-enter your weight.'
        render :index

    rescue NoWeightError
        flash.now[:error] = 'Your input is same as former one.'
        render :index

    end

end

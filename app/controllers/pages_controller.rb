class PagesController < ApplicationController

  # GET /pages
  def index
    @pages = Page.all

    render json: @pages
  end

  # POST /pages
  def create
    if params[:url].blank?
      return render json: {:errors => "Url can't be blank" }, status: :unprocessable_entity
    end

    page = Page.new
    page.url = url
    page.content = Parser.new(url).parse

    if page.save
      render json: page, status: :created
    else
      render json: page.errors, status: :unprocessable_entity
    end
  end

  private

  def url
    @url ||= CGI.unescape(params[:url])
  end

end

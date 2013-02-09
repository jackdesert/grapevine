class RumorsController < ApplicationController
  COOKIE_NAME = :already_read_ids
  SPLIT_TOKEN = ':'

  respond_to :json

  before_filter :initialize_cookie, :seed_if_needed

  def index
    ids = get_read_ids_as_array_of_strings
    rumors = Rumor.all_with_already_read_attribute_set(ids)
    respond_with rumors
  end

  def show
    respond_with Rumor.find(params[:id])
  end

  def create
    rumor = Rumor.create(params[:rumor])
    save_in_cookie_as_read(rumor)
    respond_with rumor 
  end

  def update
    rumor = Rumor.update(params[:id], params[:rumor])
    if params[:already_read]
      rumor.mark_as_read
      save_in_cookie_as_read(rumor)
    end
    respond_with rumor
  end

  def destroy
    respond_with Rumor.destroy(params[:id])
  end

  protected

  def seed_if_needed
    Farmer.seed_if_needed
  end

  def initialize_cookie
    cookies[COOKIE_NAME] ||= ''
  end

  def save_in_cookie_as_read(rumor)
    # Cookies don't support arrays natively
    unless already_saved_in_cookie_as_read?(rumor)
      cookies[COOKIE_NAME] = cookies[COOKIE_NAME].to_s.split(SPLIT_TOKEN).push(rumor.id.to_s).join(SPLIT_TOKEN)
    end
  end

  def already_saved_in_cookie_as_read?(rumor)
    get_read_ids_as_array_of_strings.include? rumor.id.to_s
  end

  def get_read_ids_as_array_of_strings
    cookies[COOKIE_NAME].split(SPLIT_TOKEN)
  end

end

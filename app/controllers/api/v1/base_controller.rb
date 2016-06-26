class Api::V1::BaseController < ActionController::Base
  skip_before_filter :verify_authenticity_token
end
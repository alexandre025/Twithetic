class ErrorsController < ApplicationController

  def not_found
    render :status => 404
  end

  def unacceptable
    redirect_to 'posts#index', status: 402, flash: { error: 'unauthorized'}
  end

  def internal_error
    render :status => 500
  end

end
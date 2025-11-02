class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActionController::ParameterMissing, with: :render_bad_request
  rescue_from StandardError, with: :render_internal_server_error

  private

  def render_not_found(_exception)
    render json: { error: '指定されたリソースが見つかりません。' }, status: :not_found
  end

  def render_bad_request(exception)
    render json: { error: "不正なリクエストです: #{exception.message}" }, status: :bad_request
  end

  def render_internal_server_error(_exception)
    render json: { error: 'サーバーで予期せぬシステムエラーが発生しました。' }, status: :internal_server_error
  end
end

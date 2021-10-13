# frozen_string_literal: true

# Paginable module for paginations
module Paginable
  def paginator
    JSOM::Pagination::Paginator.new
  end

  def paginate(collection)
    paginator.call(collection,
                   params: pagination_params,
                   base_url: request.url)
  end

  def options(paginated)
    {
      meta: paginated.meta.to_h,
      links: paginated.links.to_h
    }
  end

  def render_collection(paginated)
    result = serializer.new(paginated.items, options(paginated))
    render json: result, status: :ok
  end

  def pagination_params
    params.permit![:page]
  end
end

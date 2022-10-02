module BaseHelper
  def app_name
    "Application"
  end

  def logo
    'logo.svg'
  end

  def will_paginate(list, options = {})
    options[:renderer] ||= BootstrapPagination::Rails
    super list, options
  end
end

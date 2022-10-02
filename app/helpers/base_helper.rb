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

  def show_errors(record)
    return if record.errors.blank?
    html = %{
    <div id="error_explanation">
      <h2>Atenção:</h2>
      <ul>
    }
    record.errors.full_messages.each do |msg|
      html << "<li>#{ msg }</li>"
    end
    html << %{
      </ul>
    </div>
    }
    html.html_safe
  end
end

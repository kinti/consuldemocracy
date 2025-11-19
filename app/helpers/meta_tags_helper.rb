# app/helpers/meta_tags_helper.rb
module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : default_meta_title
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : default_meta_description
  end

  def meta_image
    content_for?(:meta_image) ? content_for(:meta_image) : default_meta_image
  end

  def default_meta_title
    if respond_to?(:current_organization) && current_organization.present?
      current_organization.name
    else
      "Plataforma de participación ciudadana"
    end
  end

  def default_meta_description
    if respond_to?(:current_organization) && current_organization.present?
      current_organization.try(:description).presence ||
        "Herramienta de participación ciudadana abierta, transparente y democrática."
    else
      "Herramienta de participación ciudadana abierta, transparente y democrática."
    end
  end

  def default_meta_image
    if respond_to?(:current_organization) &&
       current_organization.respond_to?(:logo) &&
       current_organization.logo.attached?
      url_for current_organization.logo
    else
      image_url("img.png")
    end
  end
end

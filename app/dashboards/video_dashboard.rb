require "administrate/base_dashboard"

class VideoDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    age_restricted: Field::Boolean,
    categories: Field::HasMany.with_options(sort_by: :name),
    # clip_attachment: Field::HasOne,
    # clip_blob: Field::HasOne,
    # thumbnail_blob: Field::HasOne,
    # thumbnail_attachment: Field::HasOne,
    # thumbnail_blob: Field::ActiveStorage,
    # clip_blob: Field::ActiveStorage,
    clip: Field::ActiveStorage,
    thumbnail: Field::ActiveStorage,
    description: Field::Text,
    slug: Field::String,
    title: Field::String,
    user: Field::BelongsTo,
    video_categories: Field::HasMany,
    views_count: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    age_restricted
    categories
    clip
    thumbnail
    user
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    age_restricted
    categories
    clip
    description
    slug
    thumbnail
    title
    user
    video_categories
    views_count
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    age_restricted
    categories
    clip
    thumbnail
    description
    slug
    title
    user
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how videos are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(video)
  #   "Video ##{video.id}"
  # end
end

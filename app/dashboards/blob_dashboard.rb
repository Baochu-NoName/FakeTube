require "administrate/base_dashboard"

class ActiveStorage::BlobDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    attachments: Field::HasMany,
    byte_size: Field::Number,
    checksum: Field::String,
    content_type: Field::String,
    filename: Field::String,
    key: Field::String,
    metadata: Field::Text,
    preview_image_attachment: Field::HasOne,
    preview_image_blob: Field::HasOne,
    service_name: Field::String,
    variant_records: Field::HasMany,
    created_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    attachments
    byte_size
    checksum
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    attachments
    byte_size
    checksum
    content_type
    filename
    key
    metadata
    preview_image_attachment
    preview_image_blob
    service_name
    variant_records
    created_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    attachments
    byte_size
    checksum
    content_type
    filename
    key
    metadata
    preview_image_attachment
    preview_image_blob
    service_name
    variant_records
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

  # Overwrite this method to customize how blobs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(blob)
  #   "ActiveStorage::Blob ##{blob.id}"
  # end
end

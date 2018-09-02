class Profile< ActiveRecord::Base
    belongs_to :user

    has_attached_file :logo, styles: { medium: "300x300>" }, 
    :url => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
    validates_attachment_content_type :logo, content_type: /\Aimage/
    validates_attachment_file_name :logo, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]
    do_not_validate_attachment_file_type :logo
end
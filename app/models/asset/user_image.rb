class Asset::UserImage < Asset

  has_attached_file :attachment,
                    styles: { thumb: '35x35#' },
                    default_style: :thumb,
                    default_url: '/default/users/image/:style/noimage.png',
                    url: '/twithetic/users/:id/image/:style/:basename.:extension',
                    path: ':rails_root/public/twithetic/users/:id/image/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  include ImageAsset

end
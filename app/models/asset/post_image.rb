class Asset::PostImage < Asset

  has_attached_file :attachment,
                    styles: { thumb: '48x48>' },
                    default_style: :thumb,
                    default_url: '/default/posts/:style/noimage.png',
                    url: '/twithetic/posts/:id/:style/:basename.:extension',
                    path: ':rails_root/public/twithetic/posts/:id/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  include ImageAsset

end
class Asset::UserBanner < Asset

  has_attached_file :attachment,
                    styles: { thumb: '280x230>', profil: '1600x400>' },
                    default_style: :thumb,
                    default_url: '/default/users/banners/:style/noimage.png',
                    url: '/twithetic/users/:id/banners/:style/:basename.:extension',
                    path: ':rails_root/public/twithetic/users/:id/banners/:style/:basename.:extension',
                    convert_options: { all: '-strip -auto-orient -colorspace sRGB' }

  include ImageAsset

end
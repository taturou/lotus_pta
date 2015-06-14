require 'rack/auth/digest/md5'
DIGEST_REALM="Lotus-PTA"

UserRepository.clear

[
  {login_name: "admin", is_admin: 1, last_name: "admin", first_name: "admin", last_name_ruby: "admin", first_name_ruby: "admin"},
].each do |user_attrs|
  admin = User.new(user_attrs)
  admin.passwd_hash = Digest::MD5.new.update('%s:%s:%s' % [admin.login_name, DIGEST_REALM, "password"])
  UserRepository.persist(admin)
end

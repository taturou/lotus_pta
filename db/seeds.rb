UserRepository.clear

[
  {name: 'Alfa'},
  {name: 'Bravo'},
  {name: 'Charlie'},
].each do |user_attrs|
  user = User.new(user_attrs)
  UserRepository.persist(user)
end
